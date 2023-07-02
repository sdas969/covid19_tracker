import 'package:covid19_tracker/views/home_screen/components/graph_widget/customise_timeline_dialog.dart';
import 'package:flutter/material.dart';

class CustomiseGraphWidget extends StatelessWidget {
  const CustomiseGraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
      onPressed: () => showDialog(
          context: context,
          builder: (context) => const CustomiseTimelineDialog()),
      visualDensity: VisualDensity.compact,
      splashRadius: 25,
      tooltip: 'Configure Graph',
      icon: const Icon(Icons.settings));
}
