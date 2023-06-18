import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/models/pair.dart';
import 'package:covid19_tracker/utils/get_spline_area_series.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

ResponsiveGridCol getSingleGraph(String title,
    List<Pair<DateTime, int>> dataList, LinearGradient linearGradient) {
  return ResponsiveGridCol(
      child: Center(
    child: SfCartesianChart(
        key: const PageStorageKey('graph'),
        zoomPanBehavior: zoomPanBehavior,
        legend: singleGraphLegend,
        primaryXAxis: DateTimeAxis(
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            numberFormat: NumberFormat.compact(),
            majorGridLines: const MajorGridLines(width: 0),
            minorGridLines: const MinorGridLines(width: 0)),
        series: <ChartSeries>[
          getSlipneAreaSeries(title, dataList, linearGradient)
        ]),
  ));
}
