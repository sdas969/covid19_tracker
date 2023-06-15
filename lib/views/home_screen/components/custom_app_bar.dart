import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.actions = const [],
      required this.imgUrl,
      this.elevation = 10,
      this.expandedHeight = 250,
      this.titleTextStyle =
          const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
      this.shape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      this.titleString = ''});
  final List<Widget> actions;
  final String imgUrl;
  final String titleString;
  final ShapeBorder shape;
  final double elevation, expandedHeight;
  final TextStyle titleTextStyle;

  @override
  Widget build(BuildContext context) => SliverAppBar(
      elevation: elevation,
      shape: shape,
      actions: actions,
      expandedHeight: expandedHeight,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Padding(
              padding: const EdgeInsets.all(20), child: Image.asset(imgUrl)),
          centerTitle: true,
          title: Text(titleString,
              textAlign: TextAlign.center, style: titleTextStyle),
          stretchModes: stretchModes),
      stretch: true);
}
