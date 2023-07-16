import 'package:covid19_tracker/constants/universal.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(appTitle,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)));
}
