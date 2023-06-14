import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class OverallStatsContent extends StatelessWidget {
  const OverallStatsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CountriesDataProvider>(
        builder: (context, countriesDataProvider, _) {
      final isDataLoaded =
          countriesDataProvider.loadingState == LoadingState.loaded &&
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
            final displayName = state.displayName;
            final name = state.name;
            final subtitle = state.subtitle;

            return ResponsiveGridCol(
                xs: layoutConfig.xs,
                lg: layoutConfig.lg,
                xl: layoutConfig.xl,
                sm: layoutConfig.sm,
                md: layoutConfig.md,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(displayName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: state.color))),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [Icon(Icons.arrow_upward)],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                              isDataLoaded
                                                  ? data![name].toString()
                                                  : '...',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  color: state.color,
                                                  fontWeight: FontWeight.w900)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]))));
          }).toList());
    });
  }
}
