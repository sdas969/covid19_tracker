import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19_tracker/constants/database_services.dart';
import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/models/geo_location.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GeoLocationDatabaseService {
  Future<GeoLocation> fetchGeoLocation(
      double latitude, double longitude) async {
    Map<String, dynamic> res = {'infoMsg': '', 'success': false};
    try {
      final data = await http.get(
          Uri.parse("$baseGeoLoactionEndpoint?lat=$latitude&lon=$longitude"),
          headers: baseHeader);

      if (data.statusCode == 200) {
        final computedData = await compute(jsonDecode, data.body);
        res.addAll(computedData);
        res['success'] = true;
        res['infoMsg'] = 'Success';
      } else {
        return await fetchGeoLocation(latitude, longitude);
      }
    } catch (error) {
      res['infoMsg'] = '$error';
      return await fetchGeoLocation(latitude, longitude);
    }
    final data = GeoLocation.fromJson(res);
    await FirebaseFirestore.instance
        .collection('locations')
        .doc(data.address!.country)
        .collection(data.address!.state!)
        .doc(data.address!.stateDistrict!)
        .collection(dateFormat.format(DateTime.now()))
        .doc()
        .set({
      'date': Timestamp.now(),
      'lat': data.lat,
      'long': data.lon,
      'displayName': data.displayName
    }, SetOptions(merge: true));
    return data;
  }
}
