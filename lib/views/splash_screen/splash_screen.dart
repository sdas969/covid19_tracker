import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/app_navigator.dart';
import 'package:covid19_tracker/app_layout.dart';
import 'package:covid19_tracker/views/splash_screen/components/loading_widget.dart';
import 'package:covid19_tracker/views/splash_screen/components/logo_widget.dart';
import 'package:covid19_tracker/views/splash_screen/components/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final CountriesDataProvider countriesDataProvider =
        Provider.of<CountriesDataProvider>(context, listen: false);
    if (countriesDataProvider.countries == null) {
      countriesDataProvider.initData().then((value) =>
          AppNavigator().pushReplacement(context, const AppLayout()));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
          child: LayoutBuilder(
              builder: (context, constraints) => Padding(
                  padding: EdgeInsets.all(constraints.maxHeight / 18),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LogoWidget(),
                        TitleWidget(),
                        CircularProgressIndicatorWidget()
                      ])))));
}
