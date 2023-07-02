import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/graph_card_header_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent(
      {super.key,
      this.shape,
      this.padding = const EdgeInsets.all(15),
      this.margin = const EdgeInsets.all(8),
      this.elevation = 5});
  final ShapeBorder? shape;
  final EdgeInsets padding;
  final double elevation;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
      builder: (context, countriesDataProvider, _) => Card(
          elevation: elevation,
          shape: shape ?? cardShape,
          margin: margin,
          child: Padding(
              padding: padding,
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GraphCardHeaderWidget(),
                    SizedBox(height: 20),
                    GraphWidget()
                  ]))));
}
