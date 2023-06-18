import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/models/pair.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/get_spline_area_series.dart';
import 'package:covid19_tracker/utils/is_timeline_fetched.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            padding: EdgeInsets.all(24.0),
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        }
        final casesDataList = fetchedData
            ? (countriesDataProvider.isDifferential
                ? countriesDataProvider
                    .countryTimeline!.timeline!.cases!.diffDataList!
                : countriesDataProvider
                    .countryTimeline!.timeline!.cases!.dataList!)
            : <Pair<DateTime, int>>[];
        final recoveredDataList = fetchedData
            ? (countriesDataProvider.isDifferential
                ? countriesDataProvider
                    .countryTimeline!.timeline!.recovered!.diffDataList!
                : countriesDataProvider
                    .countryTimeline!.timeline!.recovered!.dataList!)
            : <Pair<DateTime, int>>[];
        final deathsDataList = fetchedData
            ? (countriesDataProvider.isDifferential
                ? countriesDataProvider
                    .countryTimeline!.timeline!.deaths!.diffDataList!
                : countriesDataProvider
                    .countryTimeline!.timeline!.deaths!.dataList!)
            : <Pair<DateTime, int>>[];

        return Center(
          child: SfCartesianChart(
              key: const PageStorageKey('graph'),
              zoomPanBehavior: zoomPanBehavior,
              legend: combinedGraphLegend,
              primaryXAxis: DateTimeAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  minorGridLines: const MinorGridLines(width: 0)),
              primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.compact(),
                majorGridLines: const MajorGridLines(width: 0),
                minorGridLines: const MinorGridLines(width: 0),
              ),
              series: <ChartSeries>[
                getSlipneAreaSeries(
                    'Cases', casesDataList, casesLinearGradient),
                getSlipneAreaSeries(
                    'Recovered', recoveredDataList, recoveredLinearGradient),
                getSlipneAreaSeries(
                    'Deaths', deathsDataList, deathsLinearGradient)
              ]),
        );
      });
}
