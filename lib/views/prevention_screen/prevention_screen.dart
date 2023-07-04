import 'package:covid19_tracker/constants/assets.dart';
import 'package:covid19_tracker/views/about_screen/about_content.dart';
import 'package:covid19_tracker/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PreventionScreen extends StatefulWidget {
  const PreventionScreen({super.key});

  @override
  State<PreventionScreen> createState() => _PreventionScreenState();
}

class _PreventionScreenState extends State<PreventionScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
          CustomAppBar(
              pinned: true,
              scrollController: _scrollController,
              imgUrl: preventionImg,
              titleString: 'Prevention'),
          const AboutContent()
        ]));
  }
}
