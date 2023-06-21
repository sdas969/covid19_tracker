import 'package:covid19_tracker/models/country_timeline.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

SplineAreaSeries<CaseType, DateTime> getSlipneAreaSeries(
        String title, List<CaseType> dataList, LinearGradient linearGradient) =>
    SplineAreaSeries<CaseType, DateTime>(
        opacity: 0.4,
        gradient: linearGradient,
        borderGradient: linearGradient,
        name: title,
        dataSource: dataList,
        xValueMapper: (CaseType data, _) => data.date,
        yValueMapper: (CaseType data, _) => data.value);
