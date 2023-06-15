import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, this.titleSize = 30});
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.loadingState != LoadingState.loaded ||
            countriesDataProvider.countryData == null) {
          return const LoadingWidget();
        }
        return Text(
            (countriesDataProvider.currState != null)
                ? countriesDataProvider.currState!
                : countriesDataProvider.currCountry!,
            style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w900));
      }),
      subtitle: Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.loadingState != LoadingState.loaded) {
          return const LoadingWidget();
        }
        return (countriesDataProvider.currState != null)
            ? Text(countriesDataProvider.currCountry!)
            : const SizedBox();
      }),
    );
  }
}
