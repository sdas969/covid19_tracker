import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/views/home_screen/components/search_button.dart';
import 'package:covid19_tracker/views/home_screen/components/theme_toggle_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverAppBar(
      elevation: 10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      actions: const [ThemeToggleButton(), SearchButton()],
      expandedHeight: 250,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/Corona.png')),
          centerTitle: true,
          title: const Text('Corona Tracker',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
          stretchModes: stretchModes),
      stretch: true);
}
