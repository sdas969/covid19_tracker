import 'package:covid19_tracker/models/layout_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final List<int> accentShades = [100, 200, 400];
final List<int> shades = List.generate(7, (index) => (index + 3) * 100);
final List<Color> casesGradient =
    accentShades.map((e) => Colors.orangeAccent[e]!).toList() +
        [Colors.orangeAccent[700]!] +
        accentShades.reversed.map((e) => Colors.orangeAccent[e]!).toList();
final List<Color> recoveredGradient =
    accentShades.map((e) => Colors.greenAccent[e]!).toList() +
        [Colors.greenAccent[700]!] +
        accentShades.reversed.map((e) => Colors.greenAccent[e]!).toList();
final List<Color> deathGradient =
    accentShades.map((e) => Colors.redAccent[e]!).toList() +
        [Colors.redAccent[700]!] +
        accentShades.reversed.map((e) => Colors.redAccent[e]!).toList();

final LinearGradient casesLinearGradient = LinearGradient(
    colors: casesGradient,
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight);
final LinearGradient recoveredLinearGradient = LinearGradient(
    colors: recoveredGradient,
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight);
final LinearGradient deathsLinearGradient = LinearGradient(
    colors: deathGradient,
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight);
final zoomPanBehavior = ZoomPanBehavior(
    enablePanning: true, enableDoubleTapZooming: true, enablePinching: true);

Legend getLegend({bool? isSingle}) {
  return Legend(
      isVisible: true,
      toggleSeriesVisibility: isSingle == null ? true : !isSingle,
      orientation: LegendItemOrientation.horizontal,
      position: LegendPosition.bottom,
      alignment: ChartAlignment.center);
}

final dateTimeAxis = DateTimeAxis(
    majorGridLines: const MajorGridLines(width: 0),
    minorGridLines: const MinorGridLines(width: 0));
final numericAxis = NumericAxis(
    numberFormat: NumberFormat.compact(),
    majorGridLines: const MajorGridLines(width: 0),
    minorGridLines: const MinorGridLines(width: 0));
final contractedTimelineLayoutConfig =
    LayoutConfig(lg: 4, md: 6, sm: 12, xl: 4, xs: 12);
final expandedTimelineLayoutConfig =
    LayoutConfig(lg: 4, md: 12, sm: 12, xl: 4, xs: 12);

enum SwitchType { combined, differential }
