import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppContent extends StatelessWidget {
  const AppContent({
    super.key,
  });

  loadLastUpdatedTime(CountriesDataProvider countryProvider) {
    if (countryProvider.loadingState == LoadingState.loaded &&
        countryProvider.countryData != null &&
        countryProvider.countryData!.success! &&
        countryProvider.countryData!.updated != null) {
      return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
          countryProvider.countryData!.updated!));
    }
    return '...';
  }

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(child: Consumer<CountriesDataProvider>(
                builder: (context, countriesDataProvider, _) {
              String lastUpdated = loadLastUpdatedTime(countriesDataProvider);
              return Text('Updated on $lastUpdated',
                  textAlign: TextAlign.center);
            }))),
        ListTile(
          title: Consumer<CountriesDataProvider>(
              builder: (context, countriesDataProvider, _) {
            return Text(countriesDataProvider.currCountry!);
          }),
        )
      ]));
}
