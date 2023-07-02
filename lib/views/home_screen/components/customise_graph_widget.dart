import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/views/home_screen/components/is_combined_switch_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/is_differential_switch_widget.dart';
import 'package:covid19_tracker/views/home_screen/components/search_button.dart';
import 'package:flutter/material.dart';

class CustomiseGraphWidget extends StatelessWidget {
  const CustomiseGraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
      shape: cardShape,
      elevation: 10,
      child: const Row(children: [
        IsCombinedSwitchWidget(),
        IsDifferentialSwitchWidget(),
        SearchButton(heroText: 'timelineSearch', searchType: 2)
      ]));
}
