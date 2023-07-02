import 'package:covid19_tracker/views/home_screen/components/graph_widget/customise_timeline_dialog.dart';
import 'package:flutter/material.dart';

class CustomiseGraphWidget extends StatelessWidget {
  const CustomiseGraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () => showDialog(
          context: context,
          builder: (context) => const CustomiseTimelineDialog()),
      child: const Icon(Icons.settings));
}
