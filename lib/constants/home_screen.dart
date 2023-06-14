import 'package:covid19_tracker/models/layout_config.dart';
import 'package:covid19_tracker/models/state_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<StretchMode> stretchModes = [
  StretchMode.zoomBackground,
  StretchMode.blurBackground,
  StretchMode.fadeTitle
];

final DateFormat dateFormat = DateFormat('dd MMMM yyyy');

final LayoutConfig layoutConfig =
    LayoutConfig(lg: 4, md: 4, sm: 6, xl: 2, xs: 6);
final List<StateModel> stateLayoutList = [
  StateModel(
      layoutConfig: layoutConfig,
      subtitle: 'todayCases',
      name: 'cases',
      color: Colors.orange,
      displayName: 'Cases'),
  StateModel(
      layoutConfig: layoutConfig,
      subtitle: 'todayRecovered',
      name: 'recovered',
      color: Colors.green,
      displayName: 'Recovered'),
  StateModel(
      layoutConfig: layoutConfig,
      subtitle: 'todayDeaths',
      name: 'deaths',
      color: Colors.red,
      displayName: 'Deaths'),
  StateModel(
      layoutConfig: layoutConfig,
      subtitle: 'todayActive',
      name: 'active',
      color: Colors.teal,
      displayName: 'Active'),
  StateModel(
      layoutConfig: layoutConfig,
      subtitle: '',
      color: Colors.blue,
      name: 'cfr',
      override: true,
      displayName: 'Case Fatality Rate (CFR)'),
  StateModel(
      layoutConfig: layoutConfig,
      subtitle: '',
      color: Colors.blue,
      name: 'rr',
      override: true,
      displayName: 'Recovery Rate')
];
