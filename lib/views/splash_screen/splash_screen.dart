import 'package:covid19_tracker/enums/loading_state.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.statsLoadingState == LoadingState.loaded &&
            countriesDataProvider.countryData != null &&
            countriesDataProvider.countryData!.success != null &&
            countriesDataProvider.countryData!.success!) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppNavigator().pushReplacement(context, const AppLayout());
          });
        }
        return Scaffold(
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
      });
}
