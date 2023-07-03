import 'package:flutter/material.dart';

class ButtonModel {
  ButtonModel(
      {required this.iconData,
      required this.label,
      required this.onPressed,
      required this.color});
  final String label;
  final IconData iconData;
  final Function() onPressed;
  final Color color;
}
