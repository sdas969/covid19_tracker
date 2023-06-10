import 'package:covid19_tracker/constants/assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset(coronaImg),
                ),
                flex: 5,
              ),
              Expanded(
                child: Center(
                    child: const Text(
                  'COVID-19 Tracker',
                  style: TextStyle(fontSize: 24),
                )),
                flex: 2,
              ),
              Expanded(child: Center(child: const CircularProgressIndicator()))
            ],
          ),
        ),
      ),
    );
  }
}
