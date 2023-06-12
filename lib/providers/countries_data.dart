import 'package:covid19_tracker/database_services/countries.dart';
import 'package:covid19_tracker/database_services/geo_location.dart';
import 'package:covid19_tracker/models/countries.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/models/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CountriesDataProvider extends ChangeNotifier {
  Countries? _countries;
  CountryData? _countryData;
  String? _currCountry;
  String? _currState;
  String? _currGeoState;

  Countries? get countries => _countries;
  String? get currCountry => _currCountry;
  String? get currState => _currState;
  CountryData? get countryData => _countryData;

  Future initData() async {
    _countries = await CountriesDatabaseService().fetchCountriesList();
    final country = await getCurrentLocation();
    await fetchCountryData(country);

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
    }
    notifyListeners();
  }

  Future<String> getCurrentLocation() async {
    _currCountry = (_countries != null &&
            _countries!.success! &&
            _countries!.countryList!.isNotEmpty)
        ? _countries?.countryList!.first
        : '';
    try {
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
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

  bool validate(GeoLocation? geoData, Countries? countries, String? country) =>
      geoData != null &&
      countries != null &&
      country != null &&
      geoData.success != null &&
      countries.success != null &&
      geoData.success! &&
      countries.success! &&
      countries.countryList != null &&
      countries.countryList!.isNotEmpty &&
      countries.countryList!.contains(country);
}
