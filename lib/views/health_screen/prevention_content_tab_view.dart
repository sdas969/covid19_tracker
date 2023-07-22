import 'package:covid19_tracker/models/tab_model.dart';
import 'package:covid19_tracker/views/health_screen/prevention_tab_bar.dart';
import 'package:flutter/material.dart';

class PreventionContentTabView extends StatefulWidget {
  const PreventionContentTabView({super.key, required this.tabData});
  final TabModel tabData;

  @override
  State<PreventionContentTabView> createState() =>
      _PreventionContentTabViewState();
}

class _PreventionContentTabViewState extends State<PreventionContentTabView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
        length: widget.tabData.tabContentList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        if (widget.tabData.title.isNotEmpty)
          Text(widget.tabData.title,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
        const SizedBox(height: 20),
        PreventionTabBar(
            tabController: _tabController,
            tabContentList: widget.tabData.tabContentList),
        const SizedBox(height: 30),
        SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: TabBarView(
                controller: _tabController,
                children: List.generate(
                    widget.tabData.tabContentList.length,
                    (index) => SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(widget.tabData.tabContentList[index].title,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(widget
                                  .tabData.tabContentList[index].description)
                            ])))))
      ]));
}
