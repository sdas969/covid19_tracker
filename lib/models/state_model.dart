import 'package:covid19_tracker/models/layout_config.dart';
import 'package:flutter/material.dart';

class StateModel {
  StateModel(
      {required this.layoutConfig,
      required this.subtitle,
      required this.displayName,
      this.denominator,
      this.numerator,
      this.isPercentage,
      required this.color,
      this.override = false,
      this.showIncrement = true,
      required this.name}) {
    if (override &&
        (denominator == null || isPercentage == null || numerator == null)) {
      throw ErrorDescription(
          'Numerator, Denominator, Ispercentage cannot be empty when override is true.');
    }
  }
  final String? numerator, denominator;
  final bool? isPercentage;
  final String displayName, name, subtitle;
  final LayoutConfig layoutConfig;
  final Color color;
  final bool override, showIncrement;
}
