// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19_tracker/models/country.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/models/country_timeline.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class CountriesDatabaseService {
  Future<List<Country>> fetchCountriesList() async {
    final countryList = <Country>[];
    try {
      final data = await FirebaseFirestore.instance
          .collection('countriesAndStates')
          .get();
      if (data.docs.isNotEmpty) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> country in data.docs) {
          countryList.add(Country.fromJson(country.data()));
        }
      }
    } catch (error) {}
    return countryList;
  }

  Future<Uint8List?> fetchCountryGeoJSONData(String country) async {
    Uint8List? jsonData;
    try {
      jsonData = await FirebaseStorage.instance
          .ref()
          .child('maps/${country.toLowerCase()}.json')
          .getData();
    } catch (e) {}
    return jsonData;
  }

  Future<CountryData> fetchCountryData(String country) async {
    Map<String, dynamic>? res = {};

    try {
      final data = await FirebaseFirestore.instance
          .collection('currentData')
          .doc(country)
          .get();

      if (data.exists) {
        res = data.data();
      }
    } catch (error) {}
    return CountryData.fromJson(res!);
  }

  Future<CountryTimeline> fetchCountryTimeline(String country) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('historicalData')
          .doc(country)
          .get();

      if (data.exists && data.data() != null && data.data()!.isNotEmpty) {
        return CountryTimeline.fromJson(data.data()!);
      }
    } catch (error) {}
    return CountryTimeline();
  }

  Future<CountryTimeline> fetchDiffCountryTimeline(String country) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('differentialHistoricalData')
          .doc(country)
          .get();

      if (data.exists && data.data() != null && data.data()!.isNotEmpty) {
        return CountryTimeline.fromJson(data.data()!);
      }
    } catch (error) {}
    return CountryTimeline();
  }
}
