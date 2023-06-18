import 'package:covid19_tracker/views/home_screen/components/app_content.dart';
import 'package:covid19_tracker/widgets/custom_app_bar.dart';
import 'package:covid19_tracker/views/home_screen/components/search_button.dart';
import 'package:covid19_tracker/views/home_screen/components/theme_toggle_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
          body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        CustomAppBar(
            actions: [ThemeToggleButton(), SearchButton()],
            imgUrl: 'assets/Corona.png',
            titleString: 'Corona Tracker'),
        AppContent()
      ]));
}
