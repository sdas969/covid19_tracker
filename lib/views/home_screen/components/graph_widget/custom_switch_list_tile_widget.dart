import 'package:covid19_tracker/constants/timeline_content.dart';
import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSwitchListTileWidget extends StatelessWidget {
  const CustomSwitchListTileWidget({super.key, required this.type});
  final SwitchType type;

  String getTitleText(SwitchType type) {
    if (type == SwitchType.combined) {
      return 'Combined Data';
    } else if (type == SwitchType.differential) {
      return 'Differential Graph';
    }
    return '';
  }

  handleOnChange(CountriesDataProvider countriesDataProvider, bool value,
      SwitchType type) {
    if (type == SwitchType.combined) {
      return countriesDataProvider.toggleViewType(value: value);
    } else if (type == SwitchType.differential) {
      countriesDataProvider.toggleGraphType(value: value);
    }
  }

  bool getValue(CountriesDataProvider countriesDataProvider) {
    if (type == SwitchType.combined) {
      return countriesDataProvider.isCombined;
    } else if (type == SwitchType.differential) {
      return countriesDataProvider.isDifferential;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
      builder: (context, countriesDataProvider, _) => SwitchListTile.adaptive(
          shape: cardShape,
          applyCupertinoTheme: false,
          value: getValue(countriesDataProvider),
          title: Text(getTitleText(type)),
          onChanged: (value) =>
              handleOnChange(countriesDataProvider, value, type)));
}
