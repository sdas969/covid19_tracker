import 'package:covid19_tracker/models/layout_config.dart';
import 'package:flutter/material.dart';

class StateModel {
  StateModel(
      {required this.layoutConfig,
      required this.subtitle,
      required this.displayName,
      required this.color,
      this.override = false,
      required this.name});
  final String displayName, name, subtitle;
  final LayoutConfig layoutConfig;
  final Color color;
  final bool override;
}
