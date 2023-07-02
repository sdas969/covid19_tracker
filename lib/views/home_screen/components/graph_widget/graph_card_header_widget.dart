import 'package:covid19_tracker/views/home_screen/components/graph_widget/customise_graph_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/graph_card_title_widget.dart';
import 'package:flutter/material.dart';

class GraphCardHeaderWidget extends StatelessWidget {
  const GraphCardHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: GraphCardTitleWidget()),
            CustomiseGraphWidget()
          ]);
}
