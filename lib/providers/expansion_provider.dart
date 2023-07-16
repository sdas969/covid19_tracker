import 'package:covid19_tracker/constants/about_screen.dart';
import 'package:flutter/material.dart';

class ExpansionProvider extends ChangeNotifier {
  final List<ExpansionTileController> _controllers =
      List.generate(aboutList.length, (index) => ExpansionTileController());
  List<ExpansionTileController> get controllers => _controllers;
  setIndex(int index) {
    for (int i = 0; i < _controllers.length; i++) {
      if (i != index && _controllers[i].isExpanded) {
        _controllers[i].collapse();
      }
    }
    if (index != -1) {
      _controllers[index].expand();
    }

    notifyListeners();
  }
}
