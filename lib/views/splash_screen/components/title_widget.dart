import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
      flex: 2,
      child: LayoutBuilder(builder: (context, constraints) {
        final textFontSize = constraints.maxHeight / 6;
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
                child: Text('COVID-19 Tracker',
                    style: TextStyle(
                        fontSize: textFontSize, fontWeight: FontWeight.w900))));
      }));
}
