import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/string_utils.dart';
import 'package:covid19_tracker/views/home_screen/components/location_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/map_view_content.dart';
import 'package:covid19_tracker/views/home_screen/components/stats_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class OverallStatsContent extends StatelessWidget {
  const OverallStatsContent({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        final isDataLoaded =
            countriesDataProvider.statsLoadingState == LoadingState.loaded &&
                countriesDataProvider.countryData != null;
        final countryData =
            isDataLoaded ? countriesDataProvider.countryData!.total : null;
        final showCountry =
            countriesDataProvider.currCountryState.first.isNotEmpty &&
                countriesDataProvider.currCountryState.second.isEmpty;
        final stateData = (isDataLoaded && !showCountry)
            ? countriesDataProvider.countryData!.states!.firstWhere((element) =>
                StringUtils().stringMatch(element.state ?? '',
                    countriesDataProvider.currCountryState.second))
            : null;

        final data = isDataLoaded
            ? (showCountry ? countryData!.toJson() : stateData!.toJson())
            : null;

        return ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveGridCol(
                  xs: 12,
                  lg: 9,
                  xl: 9,
                  sm: 12,
                  md: 9,
                  child: ResponsiveGridRow(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <ResponsiveGridCol>[
                            ResponsiveGridCol(child: const LocationWidget())
                          ] +
                          stateLayoutList.map((state) {
                            final layoutConfig = state.layoutConfig;
                            return ResponsiveGridCol(
                                xs: layoutConfig.xs,
                                lg: layoutConfig.lg,
                                xl: layoutConfig.xl,
                                sm: layoutConfig.sm,
                                md: layoutConfig.md,
                                child: StatsCardWidget(
                                    data: data,
                                    state: state,
                                    isDataLoaded: isDataLoaded));
                          }).toList())),
              ResponsiveGridCol(
                  xs: 12,
                  lg: 3,
                  xl: 3,
                  sm: 12,
                  md: 3,
                  child: const MapViewContent())
            ]);
      });
}
