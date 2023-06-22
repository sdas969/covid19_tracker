import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapViewContent extends StatelessWidget {
  const MapViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.statsLoadingState != LoadingState.loaded ||
            countriesDataProvider.countryData == null ||
            countriesDataProvider.countryData!.success == null ||
            !countriesDataProvider.countryData!.success!) {
          return const CircularProgressIndicator();
        }
        CountryData countryData = countriesDataProvider.countryData!;
        return SfMaps(
          layers: [
            MapShapeLayer(
                source: MapShapeSource.asset('/maps/india.json',
                    shapeDataField: 'name',
                    primaryValueMapper: (int index) =>
                        countryData.states![index].state!,
                    bubbleSizeMapper: (int index) =>
                        countryData.states![index].cases!.toDouble(),
                    bubbleColorValueMapper: (int index) {
                      return Colors.red.withOpacity(0.5);
                    },
                    dataCount: countryData.states!.length))
          ],
        );
      }),
    );
  }
}
