import 'dart:convert';
import 'package:covid19_tracker/constants/database_services.dart';
import 'package:covid19_tracker/models/countries.dart';
import 'package:covid19_tracker/models/country_data.dart';
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
      print('hello');
      final data = await http.get(Uri.parse(baseCountryDataEndpoint),
          headers: baseHeader);
      print('sdas test  ' + data.statusCode.toString());
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
    print('sdas ' + country);
    print('hello1');
    try {
      final data = await http.get(Uri.parse("$baseCountryDataEndpoint$country"),
          headers: baseHeader);
      print(data.statusCode);
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
}
