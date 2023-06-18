import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IsCombinedSwitchWidget extends StatelessWidget {
  const IsCombinedSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
      builder: (context, countriesDataProvider, _) => Switch.adaptive(
          value: countriesDataProvider.isCombined,
          onChanged: (value) =>
              countriesDataProvider.toggleViewType(value: value)));
}
