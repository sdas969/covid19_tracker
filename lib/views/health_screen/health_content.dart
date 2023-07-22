import 'package:covid19_tracker/constants/health_screen.dart';
import 'package:covid19_tracker/views/health_screen/health_header.dart';
import 'package:covid19_tracker/views/health_screen/prevention_content_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HealthContent extends StatefulWidget {
  const HealthContent({super.key});

  @override
  State<HealthContent> createState() => _HealthContentState();
}

class _HealthContentState extends State<HealthContent>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController =
        TabController(length: preventionTabsContentList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HealthHeader(),
                  ResponsiveGridRow(
                      children: List<ResponsiveGridCol>.generate(
                          tabContentList.length,
                          (index) => ResponsiveGridCol(
                              xl: 6,
                              lg: 6,
                              md: 6,
                              sm: 12,
                              xs: 12,
                              child: PreventionContentTabView(
                                  tabData: tabContentList[index]))))
                ]))
      ]));
}
