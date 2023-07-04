import 'package:covid19_tracker/constants/assets.dart';
import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/views/home_screen/components/app_content.dart';
import 'package:covid19_tracker/views/home_screen/components/location_toggle_button.dart';
import 'package:covid19_tracker/widgets/custom_app_bar.dart';
import 'package:covid19_tracker/views/home_screen/components/theme_toggle_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
            CustomAppBar(
                scrollController: _scrollController,
                actions: const [LocationToggleButton(), ThemeToggleButton()],
                imgUrl: coronaImg,
                titleString: appTitle),
            const AppContent()
          ]));
}
