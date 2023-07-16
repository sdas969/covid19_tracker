import 'package:covid19_tracker/constants/about_screen.dart';
import 'package:covid19_tracker/views/about_screen/components/about_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ButtonGridWidget extends StatelessWidget {
  const ButtonGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ResponsiveGridRow(
            children: List.generate(
                buttonList.length,
                (index) => ResponsiveGridCol(
                    lg: 4,
                    xl: 4,
                    xs: 6,
                    sm: 6,
                    md: 6,
                    child: AboutButton(buttonData: buttonList[index])))),
      );
}
