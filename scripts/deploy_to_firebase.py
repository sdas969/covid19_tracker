import requests
import json
from datetime import datetime
from math import ceil
import firebase_admin
from collections import OrderedDict
from firebase_admin import credentials
from firebase_admin import firestore

# Date formats and base URLs
date_format = "%m/%d/%y"
headers = {"accept": "application/json"}
countryListBaseURL = 'https://disease.sh/v3/covid-19/gov/'
historicalDataBaseURL = 'https://corona.lmao.ninja/v3/covid-19/historical/'
historicalDataQueryParams = '?lastdays=all'
geoLocationBaseURL = "https://geocode.maps.co/search?q="

# Firebase credentials
cred = credentials.Certificate('scripts/covid19_tracker_private_key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

currDataRef = db.collection('currentData')
collection_ref = db.collection('historicalData')
diff_collection_ref = db.collection('differentialHistoricalData')
countryStatesCollectionRef = db.collection('countriesAndStates')

countryStatesMap = {}
allCountriesData = {}
allCountriesDiffData = {}

# Tone down data without loosing trend


def piecewiseAggregation(data, segments):
    if len(data) <= segments:
        return data

    segmentSize = ceil(len(data) / segments)
    reducedData = []

    for i in range(0, len(data), segmentSize):
        endIndex = i + segmentSize
        if endIndex >= len(data):
            endIndex = len(data) - 1

        segment = data[i:endIndex]
        aggregateValue = computeAggregateValue(segment)
        reducedData.append(aggregateValue)

    return reducedData

# Used for Piecewise Aggregation


def computeAggregateValue(segment):
    segmentStart = segment[0]['date']

    maxPair = max(segment, key=lambda pair: pair['value'])

    aggregateValue = {
        'date': segmentStart,
        'value': maxPair['value']
    }

    return aggregateValue

# Fetch countries list


def getCountriesList():
    countriesListResponse = requests.get(countryListBaseURL, headers=headers)
    if countriesListResponse.status_code != 200:
        return getCountriesList()
    return countriesListResponse.json()

# Forward lookup, get lat-long from address


def getLatLongFromAddress(address):
    geoLocationResponse = requests.get(
        geoLocationBaseURL + address, headers=headers)
    if geoLocationResponse.status_code != 200:
        return getLatLongFromAddress(address)
    jsonData = geoLocationResponse.json()
    return (float(jsonData[0]["lat"]), float(jsonData[0]["lon"]))

# Fetch Cummulative & Differential data for specific country


def getHistoricalDataForCountry(country):
    countryResponse = requests.get(
        historicalDataBaseURL + country + historicalDataQueryParams, headers=headers)
    if countryResponse.status_code != 200:
        return getHistoricalDataForCountry(country)
    data = json.loads(countryResponse.content, object_pairs_hook=OrderedDict)
    lat, long = getLatLongFromAddress(country)
    cases = convertMapToSortedList(data['timeline']['cases'])
    recovered = convertMapToSortedList(data['timeline']['recovered'])
    deaths = convertMapToSortedList(data['timeline']['deaths'])

    diffCases = getDiffDataFromList(cases)
    diffRecovered = getDiffDataFromList(recovered)
    diffDeaths = getDiffDataFromList(deaths)
    jsonData = {
        'country': country,
        'lat': lat,
        'long': long,
        'cases': piecewiseAggregation(cases, 20),
        'recovered': piecewiseAggregation(recovered, 20),
        'deaths': piecewiseAggregation(deaths, 20),
    }
    diffJsonData = {
        'country': country,
        'lat': lat,
        'long': long,
        'cases': piecewiseAggregation(diffCases, 20),
        'recovered': piecewiseAggregation(diffRecovered, 20),
        'deaths': piecewiseAggregation(diffDeaths, 20),
    }
    return (jsonData, diffJsonData)

# Get differential data from cummulative data


def getDiffDataFromList(arr):
    res = []
    for i in range(1, len(arr)):
        res.append({
            'date': arr[i]['date'],
            'value': arr[i]['value'] - arr[i - 1]['value']
        })
    return res

# Convert cases map to sorted list based on date


def convertMapToSortedList(map):
    arr = []
    for date, value in map.items():
        arr.append({
            'date': datetime.strptime(date, date_format),
            'value': value
        })
    arr.sort(key=lambda x: x['date'])
    for i in range(1, len(arr)):
        arr[i]["value"] = max(arr[i]["value"], arr[i - 1]["value"])
    return arr

# Fetch current cases for specific country


def getCurrDataForCountry(country):
    countryResponse = requests.get(
        countryListBaseURL + country, headers=headers)
    if countryResponse.status_code != 200:
        return getCurrDataForCountry(country)
    return json.loads(countryResponse.content, object_pairs_hook=OrderedDict)

# Fetch current cases for India


def getcurrDataForIndia():
    countryResponse = requests.get(
        countryListBaseURL + "India", headers=headers)
    if countryResponse.status_code != 200:
        return getcurrDataForIndia()
    res = json.loads(countryResponse.content, object_pairs_hook=OrderedDict)
    if 'updated' in res:
        res['updated'] = datetime.fromtimestamp(
            int(res['updated']) / 1000)
    countryStatesMap['India'] = {'name': 'India'}
    indiaData = countryStatesMap['India']
    indiaData['states'] = []
    states = indiaData['states']
    if 'states' in res:
        for stateData in res['states']:
            stateData['state'] = stateData['state'].replace('*', '')
            state = stateData['state']
            address = state + ', India'
            lat, long = getLatLongFromAddress(address)
            states.append({
                'name': state,
                'country': 'India',
                'lat': lat,
                'long': long
            })
            stateData['lat'] = lat
            stateData['long'] = long
    return res


countriesList = getCountriesList()
print('Fetched Countries List.')

currIndiaData = getcurrDataForIndia()

currDataDoc = currDataRef.document('India')
currDataDoc.set(currIndiaData)
print('Fetched & Uploaded Current Data for India.')

for country in countriesList:
    historicalData, diffHistoricalData = getHistoricalDataForCountry(country)
    allCountriesData[country] = historicalData
    allCountriesDiffData[country] = diffHistoricalData
    doc_ref = collection_ref.document(country)
    diff_doc_ref = diff_collection_ref.document(country)
    doc_ref.set(historicalData)
    diff_doc_ref.set(diffHistoricalData)
print('Fetched & Uploaded Historical Data for each country.')

allDocRef = collection_ref.document('All')
allDocRef.set(allCountriesData)
print('Uploaded Historical Data for all countries.')

diffAllDocRef = diff_collection_ref.document('All')
diffAllDocRef.set(allCountriesDiffData)
print('Uploaded Differential Historical Data for all countries.')


for country, data in countryStatesMap.items():
    countryStatesDocRef = countryStatesCollectionRef.document(country)
    countryStatesDocRef.set(data)
print('Uploaded Countries & States Data.')

print('Data uploaded to Firebase successfully!')
