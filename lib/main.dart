import 'package:covid19_tracker/base_screen.dart';
import 'package:covid19_tracker/providers/app_theme.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ChangeNotifierProvider(create: (_) => CountriesDataProvider())
      ], builder: (context, _) => const BaseScreen());
}
