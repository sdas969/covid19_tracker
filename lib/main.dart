import 'package:covid19_tracker/base_screen.dart';
import 'package:covid19_tracker/firebase_options.dart';
import 'package:covid19_tracker/providers/app_theme.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/providers/expansion_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ChangeNotifierProvider(create: (_) => CountriesDataProvider()),
        ChangeNotifierProvider(create: (_) => ExpansionProvider()),
      ], builder: (context, _) => const BaseScreen());
}
