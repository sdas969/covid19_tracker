import 'package:covid19_tracker/constants/assets.dart';
import 'package:covid19_tracker/views/health_screen/health_header_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HealthHeader extends StatelessWidget {
  const HealthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ResponsiveGridRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveGridCol(
                xs: 12,
                sm: 12,
                md: 9,
                lg: 9,
                xl: 9,
                child: const HealthHeaderListTile()),
            ResponsiveGridCol(
                xs: 12,
                sm: 12,
                md: 3,
                lg: 3,
                xl: 3,
                child: Lottie.asset(preventionLottie,
                    height: 200, alignment: Alignment.center))
          ]);
}
