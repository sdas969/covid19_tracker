import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/combined_graph.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/segregated_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: countriesDataProvider.isCombined
                ? const CombinedGraph()
                : const SegregatedGraph());
      });
}
