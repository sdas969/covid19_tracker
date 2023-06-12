import 'package:covid19_tracker/views/about_screen/about_screen.dart';
import 'package:covid19_tracker/views/home_screen/home_screen.dart';
import 'package:covid19_tracker/views/prevention_screen/prevention_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => const DefaultTabController(
      length: 3,
      child: Scaffold(
          bottomNavigationBar:
              TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
            Tab(icon: Icon(FontAwesome5.virus)),
            Tab(icon: Icon(RpgAwesome.health)),
            Tab(icon: Icon(Icons.info))
          ]),
          body: TabBarView(
              children: [HomeScreen(), PreventionScreen(), AboutScreen()])));
}
