import 'package:covid19_tracker/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
      flex: 5,
      child: AspectRatio(aspectRatio: 1.0, child: Lottie.asset(coronaLottie)));
}
