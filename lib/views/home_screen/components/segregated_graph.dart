import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/get_single_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SegregatedGraph extends StatelessWidget {
  const SegregatedGraph({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        final casesDataList = countriesDataProvider.isDifferential
            ? countriesDataProvider.diffCountryTimeline!.cases!
            : countriesDataProvider.countryTimeline!.cases!;
        final recoveredDataList = countriesDataProvider.isDifferential
            ? countriesDataProvider.diffCountryTimeline!.recovered!
            : countriesDataProvider.countryTimeline!.recovered!;
        final deathsDataList = countriesDataProvider.isDifferential
            ? countriesDataProvider.diffCountryTimeline!.deaths!
            : countriesDataProvider.countryTimeline!.deaths!;
        return ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getSingleGraph('Cases', casesDataList, casesLinearGradient),
              getSingleGraph(
                  'Recovered', recoveredDataList, recoveredLinearGradient),
              getSingleGraph('Deaths', deathsDataList, deathsLinearGradient),
            ]);
      });
}
