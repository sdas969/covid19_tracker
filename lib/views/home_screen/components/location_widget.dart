import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/widgets/text_loading_widget.dart';
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
        if (countriesDataProvider.statsLoadingState != LoadingState.loaded ||
            countriesDataProvider.countryData == null) {
          return const TextLoadingWidget();
        }
        return Text(
            (countriesDataProvider.currCountryState.second.isNotEmpty)
                ? countriesDataProvider.currCountryState.second
                : countriesDataProvider.currCountryState.first,
            style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w900));
      }),
      subtitle: Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.statsLoadingState != LoadingState.loaded) {
          return const TextLoadingWidget();
        }
        return (countriesDataProvider.currCountryState.second.isNotEmpty)
            ? Text(countriesDataProvider.currCountryState.first)
            : const SizedBox();
      }),
    );
  }
}
