// ignore_for_file: empty_catches

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19_tracker/constants/database_services.dart';
import 'package:covid19_tracker/models/country.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/models/country_timeline.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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

  Future<String> fetchCountryGeoJSONData(String country) async {
    String jsonData = '';
    try {
      final data = await FirebaseStorage.instance
          .ref('maps/${country.toLowerCase()}.json')
          .getData();
      jsonData = String.fromCharCodes(data!.toList());
    } catch (e) {}
    return jsonData;
  }

  Future<CountryData> fetchCountryData(String country) async {
    Map<String, dynamic> res = {'infoMsg': '', 'success': false};

    try {
      final data = await http.get(Uri.parse("$baseCountryDataEndpoint$country"),
          headers: baseHeader);

      if (data.statusCode == 200) {
        final computedData = await compute(jsonDecode, data.body);
        res.addAll(computedData);
        res['success'] = true;
        res['infoMsg'] = 'Success';
      } else {
        return await fetchCountryData(country);
      }
    } catch (error) {
      res['infoMsg'] = '$error';

      return await fetchCountryData(country);
    }
    return CountryData.fromJson(res);
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
