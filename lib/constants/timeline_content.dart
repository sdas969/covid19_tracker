import 'package:flutter/material.dart';

final List<int> accentShades = [100, 200, 400];
final List<int> shades = List.generate(7, (index) => (index + 3) * 100);
final List<Color> casesGradient =
    accentShades.map((e) => Colors.orangeAccent[e]!).toList() +
        [Colors.orangeAccent[700]!] +
        accentShades.reversed.map((e) => Colors.orangeAccent[e]!).toList();
final List<Color> recoveredGradient =
    accentShades.map((e) => Colors.greenAccent[e]!).toList() +
        [Colors.greenAccent[700]!] +
        accentShades.reversed.map((e) => Colors.greenAccent[e]!).toList();
final List<Color> deathGradient =
    accentShades.map((e) => Colors.redAccent[e]!).toList() +
        [Colors.redAccent[700]!] +
        accentShades.reversed.map((e) => Colors.redAccent[e]!).toList();

final LinearGradient casesLinearGradient = LinearGradient(
    colors: casesGradient,
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight);
final LinearGradient recoveredLinearGradient = LinearGradient(
    colors: recoveredGradient,
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight);
final LinearGradient deathsLinearGradient = LinearGradient(
    colors: deathGradient,
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight);
