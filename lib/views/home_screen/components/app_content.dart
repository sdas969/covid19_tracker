import 'package:covid19_tracker/views/home_screen/components/overall_stats_content.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/timeline_content.dart';
import 'package:covid19_tracker/views/home_screen/components/updated_on_widget.dart';
import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  const AppContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        const UpdatedOnWidget(),
        const OverallStatsContent(),
        const TimelineContent()
      ]));
}
