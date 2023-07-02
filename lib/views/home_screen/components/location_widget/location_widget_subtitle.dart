import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/widgets/text_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationWidgetSubtitle extends StatelessWidget {
  const LocationWidgetSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.statsLoadingState != LoadingState.loaded) {
          return const TextLoadingWidget();
        }
        return (countriesDataProvider.currCountryState.second.isNotEmpty)
            ? Text(countriesDataProvider.currCountryState.first)
            : const SizedBox();
      });
}
