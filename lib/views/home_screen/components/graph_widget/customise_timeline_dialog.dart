import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/custom_switch_list_tile_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/search_button.dart';
import 'package:flutter/material.dart';

class CustomiseTimelineDialog extends StatelessWidget {
  const CustomiseTimelineDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
      shape: cardShape,
      scrollable: true,
      actions: const [CloseButton()],
      content: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSwitchListTileWidget(type: SwitchType.combined),
            CustomSwitchListTileWidget(type: SwitchType.differential),
            SearchButton(
                heroText: 'timelineSearch', searchType: 2, extended: true)
          ]));
}
