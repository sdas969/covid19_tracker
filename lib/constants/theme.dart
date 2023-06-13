import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme _textTheme = GoogleFonts.latoTextTheme();
final AppBarTheme _appBarTheme = AppBarTheme(
    titleTextStyle: _textTheme.bodyMedium,
    toolbarTextStyle: _textTheme.bodyMedium);
const Color inidicatorColor = Colors.red;

final darkTextStyle = GoogleFonts.lato().copyWith(color: Colors.white);
final lightTextStyle = GoogleFonts.lato().copyWith(color: Colors.black);

final darkTextTheme = _textTheme.copyWith(
    titleLarge: darkTextStyle,
    titleMedium: darkTextStyle,
    titleSmall: darkTextStyle,
    headlineLarge: darkTextStyle,
    displayLarge: darkTextStyle,
    displayMedium: darkTextStyle,
    displaySmall: darkTextStyle,
    headlineMedium: darkTextStyle,
    labelMedium: darkTextStyle,
    bodyLarge: darkTextStyle,
    bodyMedium: darkTextStyle,
    bodySmall: darkTextStyle);

final lightTextTheme = _textTheme.copyWith(
    titleLarge: lightTextStyle,
    bodyLarge: lightTextStyle,
    bodyMedium: lightTextStyle,
    bodySmall: lightTextStyle);

final ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: darkTextTheme,
    appBarTheme: _appBarTheme,
    colorScheme: const ColorScheme.dark().copyWith(primary: inidicatorColor),
    indicatorColor: inidicatorColor,
    primaryTextTheme: darkTextTheme);

final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: lightTextTheme,
    appBarTheme: _appBarTheme,
    colorScheme: const ColorScheme.light().copyWith(primary: inidicatorColor),
    indicatorColor: inidicatorColor,
    primaryTextTheme: lightTextTheme);
