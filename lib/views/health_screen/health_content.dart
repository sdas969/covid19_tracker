import 'package:covid19_tracker/constants/health_screen.dart';
import 'package:covid19_tracker/views/health_screen/health_header.dart';
import 'package:covid19_tracker/views/health_screen/prevention_tab_bar.dart';
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
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                        xl: 6,
                        lg: 6,
                        md: 6,
                        sm: 12,
                        xs: 12,
                        child: Column(
                          children: [
                            const Text('Preventions',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900)),
                            PreventionTabBar(tabController: _tabController),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              child: TabBarView(
                                  controller: _tabController,
                                  children: List.generate(
                                      preventionTabsContentList.length,
                                      (index) => ListTile(
                                            title: Text(
                                                preventionTabsContentList[index]
                                                    .description),
                                          ))),
                            )
                          ],
                        )),
                    ResponsiveGridCol(
                        xl: 6,
                        lg: 6,
                        md: 6,
                        sm: 12,
                        xs: 12,
                        child: PreventionTabBar(tabController: _tabController))
                  ])
                ]))
      ]));
}
