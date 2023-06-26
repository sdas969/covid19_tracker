// ignore_for_file: prefer_final_fields

import 'dart:typed_data';

import 'package:covid19_tracker/database_services/countries.dart';
import 'package:covid19_tracker/database_services/geo_location.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/models/country.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/models/country_timeline.dart';
import 'package:covid19_tracker/models/geo_location.dart';
import 'package:covid19_tracker/models/pair.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CountriesDataProvider extends ChangeNotifier {
  List<Country>? _countries;
  CountryData? _countryData;
  CountryTimeline? _countryTimeline;
  CountryTimeline? _diffCountryTimeline;
  Pair<String, String> _currCountryState = Pair('', '');
  Pair<String, String> _currGeoCountryState = Pair('', '');
  Uint8List? _currCountryGeoJSONData;
  bool _isDifferential = true;
  bool _isCombined = true;
  final List<bool> _activeCategories = List.generate(3, (index) => true);
  LoadingState _statsLoadingState = LoadingState.toBeLoaded;
  LoadingState _timelineLoadingState = LoadingState.toBeLoaded;
  LoadingState _mapLoadingState = LoadingState.toBeLoaded;

  List<Country>? get countries => _countries;
  Pair<String, String> get currCountryState => _currCountryState;
  Pair<String, String> get currGeoCountryState => _currGeoCountryState;
  Uint8List? get currCountryGeoJSONData => _currCountryGeoJSONData;
  CountryData? get countryData => _countryData;
  CountryTimeline? get countryTimeline => _countryTimeline;
  CountryTimeline? get diffCountryTimeline => _diffCountryTimeline;
  LoadingState get statsLoadingState => _statsLoadingState;
  LoadingState get timelineLoadingState => _timelineLoadingState;
  LoadingState get mapLoadingState => _mapLoadingState;
  bool get isDifferential => _isDifferential;
  bool get isCombined => _isCombined;
  List<bool> get activeCategories => _activeCategories;

  Future initData() async {
    _countries = await CountriesDatabaseService().fetchCountriesList();
    final countryState = await getCurrentLocation();
    _currGeoCountryState = countryState;
    _currCountryState.first = countryState.first;
    await fetchCountryData(_currCountryState.first, true);
    await fetchCountryTimeline(_currCountryState.first);
    await fetchCurrCountryGeoJSONData(_currCountryState.first);
    notifyListeners();
  }

  changeStatsLoadingState(LoadingState state) {
    _statsLoadingState = state;
    notifyListeners();
  }

  changeTimelineLoadingState(LoadingState state) {
    _timelineLoadingState = state;
    notifyListeners();
  }

  changeLocation(Pair<String, String> location) async {
    _currCountryState = location;
    await fetchCountryData(_currCountryState.first, false);
    await fetchCountryTimeline(_currCountryState.first);
    await fetchCurrCountryGeoJSONData(_currCountryState.first);
    notifyListeners();
  }

  fetchCountryData(String country, bool isGeolocation) async {
    _countryData = await CountriesDatabaseService().fetchCountryData(country);
    if (isGeolocation) {
      if (_countryData != null &&
          _countryData!.states != null &&
          _countryData!.states!.indexWhere(
                  (element) => element.state == _currGeoCountryState.second) !=
              -1) {
        _currCountryState.second = _currGeoCountryState.second;
      } else {
        _currCountryState.second = '';
      }
    }

    _statsLoadingState = LoadingState.loaded;
    notifyListeners();
  }

  fetchCurrCountryGeoJSONData(String country) async {
    _currCountryGeoJSONData =
        await CountriesDatabaseService().fetchCountryGeoJSONData(country);
    _mapLoadingState = LoadingState.loaded;
    notifyListeners();
  }

  fetchCountryTimeline(String country) async {
    _countryTimeline =
        await CountriesDatabaseService().fetchCountryTimeline(country);
    _diffCountryTimeline =
        await CountriesDatabaseService().fetchDiffCountryTimeline(country);
    _timelineLoadingState = LoadingState.loaded;
    notifyListeners();
  }

  toggleGraphType({bool? value}) {
    if (value == null) {
      _isDifferential = !_isDifferential;
    } else {
      _isDifferential = value;
    }

    notifyListeners();
  }

  toggleViewType({bool? value}) {
    if (value == null) {
      _isCombined = !_isCombined;
    } else {
      _isCombined = value;
    }
    notifyListeners();
  }

  Future<Pair<String, String>> getCurrentLocation() async {
    _statsLoadingState = LoadingState.loading;
    notifyListeners();
    Pair<String, String> countryState = Pair('', '');
    countryState.first = ((_countries != null && _countries!.isNotEmpty)
        ? _countries?.first.name
        : '') as String;
    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        return countryState;
      }

      Position position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          desiredAccuracy: LocationAccuracy.high);
      final geoData = await GeoLocationDatabaseService()
          .fetchGeoLocation(position.latitude, position.longitude);
      if (validate(geoData, _countries, geoData.address!.country)) {
        countryState.first = geoData.address!.country ?? '';
        countryState.second = geoData.address!.state ?? '';
      }
    } catch (e) {
      return countryState;
    }
    return countryState;
  }

  bool validate(
          GeoLocation? geoData, List<Country>? countries, String? country) =>
      geoData != null &&
      countries != null &&
      country != null &&
      geoData.success != null &&
      countries.isNotEmpty &&
      geoData.success! &&
      countries.indexWhere(
              (countryData) => countryData.name!.compareTo(country) == 0) !=
          -1;
}
