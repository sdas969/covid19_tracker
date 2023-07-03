import 'package:covid19_tracker/constants/universal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme _textTheme = GoogleFonts.latoTextTheme();
final AppBarTheme _appBarTheme = AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
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
final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: Colors.red,
    iconColor: Colors.red,
    enabledBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.red)),
    border: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.red)),
    focusedBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.red, width: 1.0)),
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white));

final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    prefixIconColor: Colors.white,
    fillColor: Colors.white.withOpacity(0.2),
    iconColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.white)),
    border: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.white)),
    focusedBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.white, width: 1.0)),
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white));
final ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: darkTextTheme,
    inputDecorationTheme: darkInputDecorationTheme,
    appBarTheme: _appBarTheme,
    colorScheme: const ColorScheme.dark().copyWith(primary: inidicatorColor),
    indicatorColor: inidicatorColor,
    primaryTextTheme: darkTextTheme);

final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: lightTextTheme,
    inputDecorationTheme: lightInputDecorationTheme,
    appBarTheme: _appBarTheme,
    colorScheme: const ColorScheme.light().copyWith(primary: inidicatorColor),
    indicatorColor: inidicatorColor,
    primaryTextTheme: lightTextTheme);
