import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/models/country_timeline.dart';
import 'package:covid19_tracker/utils/get_spline_area_series.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

ResponsiveGridCol getSingleGraph(
    String title, List<CaseType> dataList, LinearGradient linearGradient) {
  final layoutConfig = (title != 'Deaths'
      ? contractedTimelineLayoutConfig
      : expandedTimelineLayoutConfig);
  return ResponsiveGridCol(
      xl: layoutConfig.xl,
      lg: layoutConfig.lg,
      sm: layoutConfig.sm,
      xs: layoutConfig.xs,
      md: layoutConfig.md,
      child: Center(
          child: SfCartesianChart(
              key: const PageStorageKey('graph'),
              zoomPanBehavior: zoomPanBehavior,
              legend: getLegend(isSingle: true),
              primaryXAxis: dateTimeAxis,
              primaryYAxis: numericAxis,
              series: <ChartSeries>[
            getSlipneAreaSeries(title, dataList, linearGradient)
          ])));
}
