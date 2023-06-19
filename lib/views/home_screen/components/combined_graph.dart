import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/get_spline_area_series.dart';
import 'package:covid19_tracker/utils/is_timeline_fetched.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CombinedGraph extends StatelessWidget {
  const CombinedGraph({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        final fetchedData = isTimelineFetched(context);
        if (!fetchedData) {
          return const Padding(
              padding: EdgeInsets.all(36.0),
              child: Center(child: CircularProgressIndicator.adaptive()));
        }
        final casesDataList = countriesDataProvider.isDifferential
            ? countriesDataProvider
                .countryTimeline!.timeline!.cases!.diffDataList!
            : countriesDataProvider.countryTimeline!.timeline!.cases!.dataList!;
        final recoveredDataList = countriesDataProvider.isDifferential
            ? countriesDataProvider
                .countryTimeline!.timeline!.recovered!.diffDataList!
            : countriesDataProvider
                .countryTimeline!.timeline!.recovered!.dataList!;
        final deathsDataList = countriesDataProvider.isDifferential
            ? countriesDataProvider
                .countryTimeline!.timeline!.deaths!.diffDataList!
            : countriesDataProvider
                .countryTimeline!.timeline!.deaths!.dataList!;

        return Center(
            child: SfCartesianChart(
                key: const PageStorageKey('graph'),
                zoomPanBehavior: zoomPanBehavior,
                legend: getLegend(),
                primaryXAxis: dateTimeAxis,
                primaryYAxis: numericAxis,
                series: <ChartSeries>[
              getSlipneAreaSeries('Cases', casesDataList, casesLinearGradient),
              getSlipneAreaSeries(
                  'Recovered', recoveredDataList, recoveredLinearGradient),
              getSlipneAreaSeries(
                  'Deaths', deathsDataList, deathsLinearGradient)
            ]));
      });
}
