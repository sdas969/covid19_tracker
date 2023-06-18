import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/enums/loading_state.dart';
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
        if (countriesDataProvider.timelineLoadingState != LoadingState.loaded ||
            countriesDataProvider.countryTimeline == null ||
            countriesDataProvider.countryTimeline!.success == null ||
            !countriesDataProvider.countryTimeline!.success!) {
          return const Center(child: CircularProgressIndicator());
        }
        return Card(
            elevation: 10,
            shape: shape ?? cardShape,
            margin: const EdgeInsets.all(8),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const GraphCardHeaderWidget(),
                      const SizedBox(height: 20),
                      if (countriesDataProvider.isCombined)
                        const CombinedGraph()
                      else
                        const SegregatedGraph()
                    ])));
      });
}
