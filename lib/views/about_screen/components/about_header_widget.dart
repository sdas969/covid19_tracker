import 'package:covid19_tracker/constants/assets.dart';
import 'package:covid19_tracker/views/about_screen/components/subtitle_widget.dart';
import 'package:covid19_tracker/views/about_screen/components/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AboutHeaderWidget extends StatelessWidget {
  const AboutHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ResponsiveGridRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveGridCol(
                xs: 12,
                sm: 12,
                md: 8,
                lg: 9,
                xl: 9,
                child: const ListTile(
                    isThreeLine: true,
                    title: TitleWidget(),
                    subtitle: SubtitleWidget())),
            ResponsiveGridCol(
                xs: 12,
                sm: 12,
                md: 4,
                lg: 3,
                xl: 3,
                child: Lottie.asset(coronaLottie))
          ]);
}
