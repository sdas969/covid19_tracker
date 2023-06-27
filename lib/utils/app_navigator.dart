import 'package:flutter/material.dart';

class AppNavigator {
  pushReplacement(BuildContext context, Widget page) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => page));
  pop(BuildContext context) => Navigator.pop(context);
  push(BuildContext context, Widget page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
