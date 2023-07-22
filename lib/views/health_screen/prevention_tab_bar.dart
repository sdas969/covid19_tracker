import 'package:covid19_tracker/models/description_model.dart';
import 'package:flutter/material.dart';

class PreventionTabBar extends StatelessWidget {
  const PreventionTabBar(
      {super.key,
      required TabController tabController,
      required this.tabContentList})
      : _tabController = tabController;

  final TabController _tabController;
  final List<DescriptionModel> tabContentList;

  @override
  Widget build(BuildContext context) => TabBar(
      controller: _tabController,
      isScrollable: true,
      tabs: List.generate(
          tabContentList.length,
          (index) => Tab(
                  child: Column(children: [
                Expanded(
                    child: Image.asset(tabContentList[index].img!,
                        fit: BoxFit.contain)),
                Text(tabContentList[index].title)
              ]))));
}
