import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/widgets/text_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationWidgetTitle extends StatelessWidget {
  const LocationWidgetTitle({
    super.key,
    required this.titleSize,
  });

  final double titleSize;

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
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
      });
}
