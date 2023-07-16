import 'package:covid19_tracker/constants/about_screen.dart';
import 'package:covid19_tracker/views/about_screen/components/about_header_widget.dart';
import 'package:covid19_tracker/views/about_screen/components/app_expanded_tile.dart';
import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        Column(
            children: [
                  const SizedBox(height: 20),
                  const AboutHeaderWidget(),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: Text('Behind The Scenes',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ] +
                List<Widget>.generate(
                    aboutList.length,
                    (index) => AppExpandedTile(
                          index: index,
                          title: aboutList[index].title,
                          description: aboutList[index].description,
                        )))
      ]));
}
