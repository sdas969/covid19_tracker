import 'package:covid19_tracker/models/pair.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
