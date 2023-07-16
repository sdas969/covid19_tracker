import 'package:covid19_tracker/views/about_screen/components/about_header_widget.dart';
import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        const Column(children: [
          SizedBox(height: 20),
          AboutHeaderWidget(),
          SizedBox(height: 20),
          ListTile(
            title: Text('Behind The Scenes'),
          )
        ])
      ]));
}
