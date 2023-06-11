import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      Expanded(child: LayoutBuilder(builder: (context, constraints) {
        final circleSize = constraints.maxHeight;
        final strokeWidth = circleSize / 25;
        return Container(
            width: circleSize,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Center(
                child: CircularProgressIndicator(strokeWidth: strokeWidth)));
      }));
}
