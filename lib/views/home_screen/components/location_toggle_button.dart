import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationToggleButton extends StatelessWidget {
  const LocationToggleButton({super.key});

  isLocationMismatch(CountriesDataProvider countriesDataProvider) =>
      countriesDataProvider.currCountryState.first !=
          countriesDataProvider.currGeoCountryState.first ||
      countriesDataProvider.currCountryState.second !=
          countriesDataProvider.currGeoCountryState.second;

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (isLocationMismatch(countriesDataProvider)) {
          return IconButton(
              enableFeedback: true,
              tooltip: 'Switch to current location',
              alignment: Alignment.center,
              onPressed: () => countriesDataProvider
                  .changeLocation(countriesDataProvider.currGeoCountryState),
              icon: const Icon(Icons.location_on));
        }
        return const SizedBox();
      });
}
