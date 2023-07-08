import 'package:covid19_tracker/views/about_screen/about_content.dart';
import 'package:covid19_tracker/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          body: CustomScrollView(controller: _scrollController, slivers: [
        CustomAppBar(
            pinned: true,
            scrollController: _scrollController,
            icon: const Icon(Icons.info, size: 100, color: Colors.white),
            imgUrl: '',
            titleString: 'About'),
        const AboutContent()
      ]));
}
