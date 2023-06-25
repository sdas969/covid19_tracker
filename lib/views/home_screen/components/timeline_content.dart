import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_card_header_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent({super.key, this.shape});
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
      builder: (context, countriesDataProvider, _) => Card(
          elevation: 10,
          shape: shape ?? cardShape,
          margin: const EdgeInsets.all(8),
          child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GraphCardHeaderWidget(),
                    SizedBox(height: 20),
                    GraphWidget()
                  ]))));
}
