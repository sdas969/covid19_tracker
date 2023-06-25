import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatedOnWidget extends StatelessWidget {
  const UpdatedOnWidget({super.key});
  loadLastUpdatedTime(CountriesDataProvider countryProvider) {
    if (countryProvider.statsLoadingState == LoadingState.loaded &&
        countryProvider.countryData != null &&
        countryProvider.countryData!.updated != null) {
      return dateFormat.format(countryProvider.countryData!.updated!);
    }
    return '...';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(child: Consumer<CountriesDataProvider>(
            builder: (context, countriesDataProvider, _) {
          String lastUpdated = loadLastUpdatedTime(countriesDataProvider);
          return Text('Updated on $lastUpdated', textAlign: TextAlign.center);
        })));
  }
}
