import requests
import json
import firebase_admin
from collections import OrderedDict
from firebase_admin import credentials
from firebase_admin import firestore
headers = {"accept": "application/json"}
countryListBaseURL = 'https://disease.sh/v3/covid-19/gov/'
historicalDataBaseURL = 'https://corona.lmao.ninja/v3/covid-19/historical/'
historicalDataQueryParams = '?lastdays=all'
cred = credentials.Certificate('scripts/covid19_tracker_private_key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

def getCountriesList():
    countriesListResponse = requests.get(countryListBaseURL, headers=headers)
    if countriesListResponse.status_code != 200:
        return getCountriesList()
    return countriesListResponse.json()


countriesList = getCountriesList()


def getHistoricalDataForCountry(country):
    countryResponse = requests.get(historicalDataBaseURL + country + historicalDataQueryParams, headers=headers)
    if countryResponse.status_code != 200:
        return getHistoricalDataForCountry(country)
    return json.loads(countryResponse.content, object_pairs_hook=OrderedDict)


def getHistoricalDataForAll():
    allCountriesResponse = requests.get(historicalDataBaseURL + ', '.join(countriesList) + historicalDataQueryParams, headers=headers)
    if allCountriesResponse.status_code != 200:
        return getHistoricalDataForAll()
    return json.loads(allCountriesResponse.content, object_pairs_hook=OrderedDict)


allCountriesData = getHistoricalDataForAll()
allCollectionRef = db.collection('historicalData')
allDocRef = allCollectionRef.document('All')
allDocRef.set(allCountriesData)

def getCurrDataForCountry(country):
    countryResponse = requests.get(countryListBaseURL + country, headers=headers)
    if countryResponse.status_code == 200:
        return getCurrDataForCountry(country)
    return json.loads(countryResponse.content, object_pairs_hook=OrderedDict)

for country in countriesList:
    historicalData = getHistoricalDataForCountry(country)
    collection_ref = db.collection('historicalData')
    doc_ref = collection_ref.document(country)
    doc_ref.set(historicalData)


print('Data uploaded to Firebase successfully!')
