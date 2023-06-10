import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme _textTheme = GoogleFonts.latoTextTheme();
final AppBarTheme _appBarTheme = AppBarTheme(
    titleTextStyle: _textTheme.bodyMedium,
    toolbarTextStyle: _textTheme.bodyMedium);
const Color inidicatorColor = Colors.red;

final ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: _textTheme.copyWith(
        bodyMedium: GoogleFonts.lato().copyWith(color: Colors.white)),
    appBarTheme: _appBarTheme,
    colorScheme: const ColorScheme.dark().copyWith(primary: inidicatorColor),
    indicatorColor: inidicatorColor,
    primaryTextTheme: _textTheme.copyWith(
        bodyMedium: GoogleFonts.lato().copyWith(color: Colors.white)));
final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: _textTheme.copyWith(
        bodyMedium: GoogleFonts.lato().copyWith(color: Colors.black)),
    appBarTheme: _appBarTheme,
    colorScheme: const ColorScheme.light().copyWith(primary: inidicatorColor),
    indicatorColor: inidicatorColor,
    primaryTextTheme: _textTheme.copyWith(
        bodyMedium: GoogleFonts.lato().copyWith(color: Colors.black)));
