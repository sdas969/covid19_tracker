import 'package:covid19_tracker/constants/assets.dart';
import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/views/about_screen/button_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) => SliverList(
          delegate: SliverChildListDelegate([
        Column(children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Lottie.asset(coronaLottie)),
          const SizedBox(height: 20),
          const Text(appTitle,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text('Made by Smarajit Das'),
          const ButtonGridWidget()
        ])
      ]));
}
