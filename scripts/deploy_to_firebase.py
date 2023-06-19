import requests
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Fetch data from API
response = requests.get('https://corona.lmao.ninja/v3/covid-19/historical/india?lastdays=all')
data = response.json()
print(data);

# Initialize Firebase
cred = credentials.Certificate('covid19_tracker_private_key.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

# Upload data to Firebase
collection_ref = db.collection('data')
for item in data:
    doc_ref = collection_ref.document()
    doc_ref.set(item)

print('Data uploaded to Firebase successfully!')