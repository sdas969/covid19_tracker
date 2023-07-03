import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/widgets/fade_on_scroll.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.scrollController,
      this.actions = const [],
      required this.imgUrl,
      this.collapsedHeight,
      this.flexibleSpace,
      this.bottom,
      this.icon,
      this.pinned = false,
      this.elevation = 10,
      this.expandedHeight = 250,
      this.titleTextStyle = const TextStyle(
          fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
      this.shape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      this.titleString = ''});
  final bool pinned;
  final List<Widget> actions;
  final String imgUrl;
  final String titleString;
  final ShapeBorder shape;
  final double elevation, expandedHeight;
  final TextStyle titleTextStyle;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? collapsedHeight;
  final Widget? icon;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => SliverAppBar(
      elevation: elevation,
      collapsedHeight: collapsedHeight,
      shape: shape,
      pinned: pinned,
      bottom: bottom,
      actions: actions,
      expandedHeight: expandedHeight,
      centerTitle: true,
      flexibleSpace: flexibleSpace ??
          FlexibleSpaceBar(
              background: FadeOnScroll(
                  zeroOpacityOffset: 150,
                  scrollController: scrollController,
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: icon ?? Image.asset(imgUrl))),
              centerTitle: true,
              title: Text(titleString,
                  textAlign: TextAlign.center, style: titleTextStyle),
              stretchModes: stretchModes),
      stretch: true);
}
