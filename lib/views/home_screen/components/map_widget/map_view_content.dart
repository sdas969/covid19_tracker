import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/models/country_data.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/views/home_screen/components/map_widget/map_tooltip_widget.dart';
import 'package:covid19_tracker/widgets/circular_loading_widget.dart';
import 'package:covid19_tracker/widgets/no_map_data_widget.dart';
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
              countriesDataProvider.mapLoadingState != LoadingState.loaded ||
              countriesDataProvider.currCountryGeoJSONData == null) {
            return const CircularLoadingWidget();
          }
          if (countriesDataProvider.currCountryGeoJSONData!.isEmpty) {
            return const NoMapDataWidget();
          }
          CountryData countryData = countriesDataProvider.countryData!;
          return SfMaps(layers: [
            MapShapeLayer(
                shapeTooltipBuilder: (BuildContext context, int dataIndex) =>
                    MapTooltipWidget(
                        text: countryData.states![dataIndex].state!),
                bubbleTooltipBuilder: (BuildContext context, int dataIndex) =>
                    MapTooltipWidget(
                        text: countryData.states![dataIndex].state!),
                source: MapShapeSource.memory(
                    countriesDataProvider.currCountryGeoJSONData!,
                    shapeDataField: 'name',
                    primaryValueMapper: (int index) =>
                        countryData.states![index].state!,
                    bubbleSizeMapper: (int index) =>
                        countryData.states![index].cases!.toDouble(),
                    bubbleColorValueMapper: (int index) =>
                        Colors.red.withOpacity(0.5),
                    dataCount: countryData.states!.length)),
          ]);
        }));
  }
}
