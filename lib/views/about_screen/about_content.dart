import 'package:covid19_tracker/constants/about_screen.dart';
import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/views/about_screen/about_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Column(children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/Corona.png')),
        const SizedBox(height: 20),
        const Text(appTitle,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Text('Made by Smarajit Das'),
        Padding(
            padding: const EdgeInsets.all(20),
            child: ResponsiveGridRow(
                children: List.generate(
                    buttonList.length,
                    (index) => ResponsiveGridCol(
                        lg: 3,
                        xl: 3,
                        xs: 6,
                        sm: 6,
                        md: 6,
                        child: AboutButton(buttonData: buttonList[index])))))
      ])
    ]));
  }
}
