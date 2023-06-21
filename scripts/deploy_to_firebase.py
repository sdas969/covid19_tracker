import requests
import json
from datetime import datetime
from math import ceil
import firebase_admin
from collections import OrderedDict
from firebase_admin import credentials
from firebase_admin import firestore


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


def computeAggregateValue(segment):
    segmentStart = segment[0]['date']

    maxPair = max(segment, key=lambda pair: pair['value'])

    aggregateValue = {
        'date': segmentStart,
        'value': maxPair['value']
    }

    return aggregateValue


date_format = "%m/%d/%y"
headers = {"accept": "application/json"}
countryListBaseURL = 'https://disease.sh/v3/covid-19/gov/'
historicalDataBaseURL = 'https://corona.lmao.ninja/v3/covid-19/historical/'
historicalDataQueryParams = '?lastdays=all'
geoLocationBaseURL = "https://geocode.maps.co/search?q="
cred = credentials.Certificate('scripts/covid19_tracker_private_key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()


def getCountriesList():
    countriesListResponse = requests.get(countryListBaseURL, headers=headers)
    if countriesListResponse.status_code != 200:
        return getCountriesList()
    return countriesListResponse.json()


def getLatLongFromAddress(address):
    geoLocationResponse = requests.get(
        geoLocationBaseURL + address, headers=headers)
    if geoLocationResponse.status_code != 200:
        return getLatLongFromAddress(address)
    jsonData = geoLocationResponse.json()
    return (float(jsonData[0]["lat"]), float(jsonData[0]["lon"]))


def getHistoricalDataForCountry(country):
    countryResponse = requests.get(
        historicalDataBaseURL + country + historicalDataQueryParams, headers=headers)
    if countryResponse.status_code != 200:
        return getHistoricalDataForCountry(country)
    data = json.loads(countryResponse.content, object_pairs_hook=OrderedDict)
    lat, long = getLatLongFromAddress(country)
    jsonData = {
        'country': country,
        'lat': lat,
        'long': long,
        'cases': piecewiseAggregation(convertMapToSortedList(data['timeline']['cases']), 20),
        'recovered': piecewiseAggregation(convertMapToSortedList(data['timeline']['recovered']), 20),
        'deaths': piecewiseAggregation(convertMapToSortedList(data['timeline']['deaths']), 20)
    }
    return jsonData


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


def getCurrDataForCountry(country):
    countryResponse = requests.get(
        countryListBaseURL + country, headers=headers)
    if countryResponse.status_code != 200:
        return getCurrDataForCountry(country)
    return json.loads(countryResponse.content, object_pairs_hook=OrderedDict)


countryStatesMap = {}


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


allCountriesData = {}

countriesList = getCountriesList()
print('Fetched Countries List.')

currIndiaData = getcurrDataForIndia()
currDataRef = db.collection('currentData')
currDataDoc = currDataRef.document('India')
currDataDoc.set(currIndiaData)
print('Fetched & Uploaded Current Data for India.')

for country in countriesList:
    historicalData = getHistoricalDataForCountry(country)
    allCountriesData[country] = historicalData
    collection_ref = db.collection('historicalData')
    doc_ref = collection_ref.document(country)
    doc_ref.set(historicalData)
print('Fetched & Uploaded Historical Data for each country.')

allCollectionRef = db.collection('historicalData')
allDocRef = allCollectionRef.document('All')
allDocRef.set(allCountriesData)

print('Uploaded Historical Data for all countries.')

countryStatesCollectionRef = db.collection('countriesAndStates')
for country, data in countryStatesMap.items():
    countryStatesDocRef = countryStatesCollectionRef.document(country)
    countryStatesDocRef.set(data)

print('Uploaded Countries & States Data.')


print('Data uploaded to Firebase successfully!')
