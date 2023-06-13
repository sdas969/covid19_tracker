import 'package:covid19_tracker/constants/theme_toggle_button.dart';
import 'package:covid19_tracker/providers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(builder: (context, appThemeProvider, _) {
      return IconButton(
          enableFeedback: true,
          tooltip: appThemeProvider.appThemeCode! == 1
              ? switchToLightText
              : switchToDarkText,
          alignment: Alignment.center,
          onPressed: () =>
              appThemeProvider.setAppTheme(1 - appThemeProvider.appThemeCode!),
          icon: Icon(appThemeProvider.appThemeCode! == 1
              ? Icons.light_mode
              : Icons.dark_mode));
    });
  }
}
