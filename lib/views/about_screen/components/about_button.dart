import 'package:covid19_tracker/models/button_model.dart';
import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  const AboutButton(
      {super.key,
      required this.buttonData,
      this.rightPadding = true,
      this.leftPadding = true});
  final ButtonModel buttonData;
  final bool leftPadding;
  final bool rightPadding;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: leftPadding ? 8 : 0,
          right: rightPadding ? 8 : 0),
      child: ElevatedButton.icon(
          onPressed: buttonData.onPressed,
          style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: buttonData.color,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 12)),
          icon: Icon(buttonData.iconData, color: Colors.white),
          label: Text(buttonData.label,
              style: const TextStyle(color: Colors.white))));
}
