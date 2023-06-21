import 'package:covid19_tracker/database_services/countries.dart';
import 'package:covid19_tracker/database_services/geo_location.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/models/country.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/models/country_timeline.dart';
import 'package:covid19_tracker/models/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CountriesDataProvider extends ChangeNotifier {
  List<Country>? _countries;
  CountryData? _countryData;
  CountryTimeline? _countryTimeline;
  CountryTimeline? _diffCountryTimeline;
  String? _currCountry;
  String? _currState;
  String? _currGeoState;
  bool _isDifferential = true;
  bool _isCombined = true;
  final List<bool> _activeCategories = List.generate(3, (index) => true);
  LoadingState _statsLoadingState = LoadingState.toBeLoaded;
  LoadingState _timelineLoadingState = LoadingState.toBeLoaded;

  List<Country>? get countries => _countries;
  String? get currCountry => _currCountry;
  String? get currState => _currState;
  CountryData? get countryData => _countryData;
  CountryTimeline? get countryTimeline => _countryTimeline;
  CountryTimeline? get diffCountryTimeline => _diffCountryTimeline;
  LoadingState get statsLoadingState => _statsLoadingState;
  LoadingState get timelineLoadingState => _timelineLoadingState;
  bool get isDifferential => _isDifferential;
  bool get isCombined => _isCombined;
  List<bool> get activeCategories => _activeCategories;

  Future initData() async {
    _countries = await CountriesDatabaseService().fetchCountriesList();
    final country = await getCurrentLocation();
    await fetchCountryData(country);
    await fetchCountryTimeline(country);
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

  fetchCountryData(String country) async {
    _countryData = await CountriesDatabaseService().fetchCountryData(country);
    if (_countryData != null &&
        _countryData!.states != null &&
        _countryData!.states!
                .indexWhere((element) => element.state == _currGeoState) !=
            -1) {
      _currState = _currGeoState;
    } else {
      _currState = '';
    }
    _statsLoadingState = LoadingState.loaded;
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

  Future<String> getCurrentLocation() async {
    _statsLoadingState = LoadingState.loading;
    notifyListeners();
    _currCountry = (_countries != null && _countries!.isNotEmpty)
        ? _countries?.first.name
        : '';
    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        return currCountry ?? '';
      }

      Position position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          desiredAccuracy: LocationAccuracy.high);
      final geoData = await GeoLocationDatabaseService()
          .fetchGeoLocation(position.latitude, position.longitude);
      if (validate(geoData, _countries, geoData.address!.country)) {
        _currCountry = geoData.address!.country;
        _currGeoState = geoData.address!.state;
      }
      // ignore: empty_catches
    } catch (e) {}
    return _currCountry ?? '';
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
