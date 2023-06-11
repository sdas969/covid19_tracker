import 'package:covid19_tracker/views/splash_screen/components/loading_widget.dart';
import 'package:covid19_tracker/views/splash_screen/components/logo_widget.dart';
import 'package:covid19_tracker/views/splash_screen/components/title_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
            padding: EdgeInsets.all(constraints.maxHeight / 18),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoWidget(),
                  TitleWidget(),
                  CircularProgressIndicatorWidget()
                ]));
      })));
}
