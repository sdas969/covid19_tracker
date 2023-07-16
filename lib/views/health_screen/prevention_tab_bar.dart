import 'package:covid19_tracker/constants/health_screen.dart';
import 'package:flutter/material.dart';

class PreventionTabBar extends StatelessWidget {
  const PreventionTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) => TabBar(
      controller: _tabController,
      isScrollable: true,
      tabs: List.generate(
          preventionTabsContentList.length,
          (index) => Tab(
                  child: Column(children: [
                Expanded(
                    child: Image.asset(preventionTabsContentList[index].img!)),
                Text(preventionTabsContentList[index].title)
              ]))));
}
