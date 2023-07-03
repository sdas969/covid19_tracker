import 'package:covid19_tracker/models/button_model.dart';
import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({super.key, required this.buttonData});
  final ButtonModel buttonData;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
          onPressed: buttonData.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonData.color,
              padding: const EdgeInsets.all(20)),
          icon: Icon(buttonData.iconData, color: Colors.white),
          label: Text(buttonData.label,
              style: const TextStyle(color: Colors.white))));
}
