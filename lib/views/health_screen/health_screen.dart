import 'package:covid19_tracker/constants/assets.dart';
import 'package:covid19_tracker/views/health_screen/health_content.dart';
import 'package:covid19_tracker/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
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
        body: CustomScrollView(controller: _scrollController, slivers: [
      CustomAppBar(
          pinned: true,
          scrollController: _scrollController,
          imgUrl: preventionImg,
          titleString: 'Health'),
      const HealthContent()
    ]));
  }
}
