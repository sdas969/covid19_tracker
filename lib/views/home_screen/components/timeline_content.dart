import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/models/pair.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CountriesDataProvider>(
        builder: (context, countriesDataProvider, _) {
      if (countriesDataProvider.timelineLoadingState != LoadingState.loaded ||
          countriesDataProvider.countryTimeline == null ||
          countriesDataProvider.countryTimeline!.success == null ||
          !countriesDataProvider.countryTimeline!.success!) {
        return const Center(child: CircularProgressIndicator());
      }
      return Card(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                SfCartesianChart(
                    key: const PageStorageKey('graph'),
                    zoomPanBehavior: ZoomPanBehavior(
                        enableMouseWheelZooming: true,
                        enablePanning: true,
                        enableDoubleTapZooming: true,
                        enablePinching: true),
                    legend: Legend(
                        isVisible: true,
                        orientation: LegendItemOrientation.vertical,
                        isResponsive: true,
                        alignment: ChartAlignment.center),
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
                          'Cases',
                          countriesDataProvider
                              .countryTimeline!.timeline!.cases!.diffDataList!,
                          casesLinearGradient),
                      getSlipneAreaSeries(
                          'Recovered',
                          countriesDataProvider.countryTimeline!.timeline!
                              .recovered!.diffDataList!,
                          recoveredLinearGradient),
                      getSlipneAreaSeries(
                          'Deaths',
                          countriesDataProvider
                              .countryTimeline!.timeline!.deaths!.diffDataList!,
                          deathsLinearGradient)
                    ])
              ])));
    });
  }

  SplineAreaSeries<Pair<DateTime, int>, DateTime> getSlipneAreaSeries(
          String title,
          List<Pair<DateTime, int>> dataList,
          LinearGradient linearGradient) =>
      SplineAreaSeries<Pair<DateTime, int>, DateTime>(
          opacity: 0.4,
          gradient: linearGradient,
          borderGradient: linearGradient,
          name: title,
          dataSource: dataList,
          xValueMapper: (Pair<DateTime, int> data, _) => data.date,
          yValueMapper: (Pair<DateTime, int> data, _) => data.value);
}
