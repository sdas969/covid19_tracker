import 'package:covid19_tracker/models/state_model.dart';
import 'package:covid19_tracker/views/home_screen/components/card_content_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/card_title_widget.dart';
import 'package:flutter/material.dart';

class StatsCardWidget extends StatelessWidget {
  const StatsCardWidget(
      {super.key,
      required this.data,
      required this.isDataLoaded,
      this.margin = const EdgeInsets.all(8),
      this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      this.elevation = 5,
      required this.state});

  final Map<String, dynamic>? data;
  final bool isDataLoaded;
  final StateModel state;
  final EdgeInsets margin;
  final double elevation;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Card(
      margin: margin,
      elevation: elevation,
      child: Padding(
          padding: padding,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTitleWidget(state: state),
                const SizedBox(height: 8),
                CardContentWidget(
                    data: data!, isDataLoaded: isDataLoaded, state: state)
              ])));
}
