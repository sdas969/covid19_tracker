import 'package:flutter/material.dart';

class MapTooltipWidget extends StatelessWidget {
  const MapTooltipWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(10),
      color: Colors.blue,
      child: Text(text, style: const TextStyle(color: Colors.white)));
}
