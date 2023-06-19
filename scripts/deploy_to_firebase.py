import requests
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
headers = {"accept": "application/json"}

cred = credentials.Certificate('./covid19_tracker_private_key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

def getCountriesList():
    countriesListResponse = requests.get('https://disease.sh/v3/covid-19/gov/', headers=headers)
    if (countriesListResponse.status_code != 200):
        return getCountriesList()
    return countriesListResponse.json()

countriesList = getCountriesList()

def getHistoricalDataForCountry(country):
    countryResponse = requests.get('https://corona.lmao.ninja/v3/covid-19/historical/'+ country + '?lastdays=all', headers=headers)
    if (countryResponse.status_code != 200):
        return getHistoricalDataForCountry(country)
    return countryResponse.json()

for country in countriesList:
    historicalData = getHistoricalDataForCountry(country)
    collection_ref = db.collection('historicalData')
    doc_ref = collection_ref.document(country)
    doc_ref.set(historicalData)


print('Data uploaded to Firebase successfully!')