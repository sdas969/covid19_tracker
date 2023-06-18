import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/views/home_screen/components/combined_graph.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_card_header_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/segregated_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent({super.key, this.shape});
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        return Card(
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
                    ])));
      });
}

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CountriesDataProvider>(
        builder: (context, countriesDataProvider, _) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child: countriesDataProvider.isCombined
              ? const CombinedGraph()
              : const SegregatedGraph());
    });
  }
}
