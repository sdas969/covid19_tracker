import 'package:flutter/material.dart';

class NoMapDataWidget extends StatelessWidget {
  const NoMapDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      const Text('No map data available for the current country.',
          textAlign: TextAlign.center);
}
