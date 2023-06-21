import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isTimelineFetched(BuildContext context) {
  CountriesDataProvider countryDataProvider =
      Provider.of(context, listen: false);
  return countryDataProvider.timelineLoadingState == LoadingState.loaded &&
      countryDataProvider.countryTimeline != null;
}
