import 'dart:convert';
import 'package:covid19_tracker/constants/database_services.dart';
import 'package:covid19_tracker/models/countries.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/models/country_timeline.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CountriesDatabaseService {
  Future<Countries> fetchCountriesList() async {
    Map<String, dynamic> res = {
      'infoMsg': '',
      'success': false,
      'countryList': []
    };
    try {
      if (kDebugMode) {
        print('hello');
      }
      final data = await http.get(Uri.parse(baseCountryDataEndpoint),
          headers: baseHeader);
      if (kDebugMode) {
        print('sdas test  ${data.statusCode}');
      }
      if (data.statusCode == 200) {
        final computedData = await compute(jsonDecode, data.body);
        res['countryList'] = computedData;
        res['success'] = true;
        res['infoMsg'] = 'Success';
      } else {
        return await fetchCountriesList();
      }
    } catch (error) {
      res['infoMsg'] = '$error';
      return await fetchCountriesList();
    }
    return Countries.fromJson(res);
  }

  Future<CountryData> fetchCountryData(String country) async {
    Map<String, dynamic> res = {'infoMsg': '', 'success': false};
    if (kDebugMode) {
      print('sdas $country');
    }
    if (kDebugMode) {
      print('hello1');
    }
    try {
      final data = await http.get(Uri.parse("$baseCountryDataEndpoint$country"),
          headers: baseHeader);
      if (kDebugMode) {
        print(data.statusCode);
      }
      if (data.statusCode == 200) {
        final computedData = await compute(jsonDecode, data.body);
        res.addAll(computedData);
        res['success'] = true;
        res['infoMsg'] = 'Success';
      } else {
        print('error');
        return await fetchCountryData(country);
      }
    } catch (error) {
      res['infoMsg'] = '$error';
      print(error);
      return await fetchCountryData(country);
    }
    return CountryData.fromJson(res);
  }

  Future<CountryTimeline> fetchCountryTimeline(String country) async {
    Map<String, dynamic> res = {'infoMsg': '', 'success': false};
    if (kDebugMode) {
      print('sdas $country');
    }
    if (kDebugMode) {
      print('hello2');
    }
    try {
      final data = await http.get(
          Uri.parse("$baseCountryTimelineEndpoint$country$timelineParams"),
          headers: baseHeader);
      if (kDebugMode) {
        print(data.statusCode);
      }
      if (data.statusCode == 200) {
        final computedData = await compute(jsonDecode, data.body);
        res.addAll(computedData);
        res['success'] = true;
        res['infoMsg'] = 'Success';
      } else {
        return await fetchCountryTimeline(country);
      }
    } catch (error) {
      res['infoMsg'] = '$error';
      return await fetchCountryTimeline(country);
    }
    return CountryTimeline.fromJson(res);
  }
}
