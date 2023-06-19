import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapViewContent extends StatefulWidget {
  const MapViewContent({super.key});

  @override
  State<MapViewContent> createState() => _MapViewContentState();
}

class _MapViewContentState extends State<MapViewContent> {
  late MapShapeSource _mapShapeSource;
  @override
  void initState() {
    _mapShapeSource = const MapShapeSource.asset('/maps/india.json',
        shapeDataField: 'STATE_NAME');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfMaps(layers: [MapShapeLayer(source: _mapShapeSource)]);
  }
}
