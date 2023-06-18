import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IsDifferentialSwitchWidget extends StatelessWidget {
  const IsDifferentialSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
      builder: (context, countriesDataProvider, _) => Switch.adaptive(
          value: countriesDataProvider.isDifferential,
          onChanged: (value) =>
              countriesDataProvider.toggleGraphType(value: value)));
}
