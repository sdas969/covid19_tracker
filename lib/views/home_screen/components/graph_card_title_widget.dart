import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphCardTitleWidget extends StatelessWidget {
  const GraphCardTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
      builder: (context, countriesDataProvider, _) => Text(
          'Country Timeline : ${countriesDataProvider.currCountry!}',
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.blueAccent,
              fontSize: 30)));
}
