import 'package:covid19_tracker/views/about_screen/components/author_widget.dart';
import 'package:covid19_tracker/views/about_screen/components/button_grid_widget.dart';
import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [AuthorWidget(), ButtonGridWidget()]);
}
