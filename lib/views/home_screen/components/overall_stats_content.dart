import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/string_utils.dart';
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
                countriesDataProvider.countryData != null &&
                countriesDataProvider.countryData!.success!;
        final countryData =
            isDataLoaded ? countriesDataProvider.countryData!.total : null;
        final stateData = isDataLoaded
            ? countriesDataProvider.countryData!.states!.firstWhere((element) =>
                StringUtils().stringMatch(
                    element.state ?? '', countriesDataProvider.currState ?? ''))
            : null;
        final showCountry = countriesDataProvider.currCountry != null &&
            countriesDataProvider.currState == null;
        final data = isDataLoaded
            ? (showCountry ? countryData!.toJson() : stateData!.toJson())
            : null;

        return ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: stateLayoutList.map((state) {
              final layoutConfig = state.layoutConfig;
              return ResponsiveGridCol(
                  xs: layoutConfig.xs,
                  lg: layoutConfig.lg,
                  xl: layoutConfig.xl,
                  sm: layoutConfig.sm,
                  md: layoutConfig.md,
                  child: StatsCardWidget(
                      data: data, state: state, isDataLoaded: isDataLoaded));
            }).toList());
      });
}
