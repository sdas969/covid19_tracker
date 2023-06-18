import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/get_spline_area_series.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CombinedGraph extends StatelessWidget {
  const CombinedGraph({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
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
        return SfCartesianChart(
            key: const PageStorageKey('graph'),
            zoomPanBehavior: ZoomPanBehavior(
                enableMouseWheelZooming: true,
                enablePanning: true,
                enableDoubleTapZooming: true,
                enablePinching: true),
            legend: Legend(
                isVisible: true,
                orientation: LegendItemOrientation.horizontal,
                isResponsive: true,
                position: LegendPosition.bottom,
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
              getSlipneAreaSeries('Cases', casesDataList, casesLinearGradient),
              getSlipneAreaSeries(
                  'Recovered', recoveredDataList, recoveredLinearGradient),
              getSlipneAreaSeries(
                  'Deaths', deathsDataList, deathsLinearGradient)
            ]);
      });
}
