import 'package:covid19_tracker/providers/app_theme.dart';
import 'package:covid19_tracker/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    final AppThemeProvider appThemeProvider =
        Provider.of<AppThemeProvider>(context, listen: false);
    Future.delayed(Duration.zero, () => appThemeProvider.initAppTheme());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Consumer<AppThemeProvider>(builder: (context, appThemeProvider, _) {
        if (appThemeProvider.appThemeCode == null) {
          return const SizedBox();
        }
        return MaterialApp(
            title: 'COVID-19 Tracker',
            theme: appThemeProvider.appThemeData,
            home: const SplashScreen());
      });
}
