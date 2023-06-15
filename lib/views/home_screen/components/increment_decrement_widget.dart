import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatelessWidget {
  const IncrementDecrementWidget(
      {super.key,
      required this.change,
      this.maxLines = 1,
      this.textOverflow = TextOverflow.ellipsis,
      this.textStyle =
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      required this.isDataLoaded,
      required this.color});
  final int change;
  final bool isDataLoaded;
  final Color color;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final int maxLines;
  IconData getIconData() {
    if (change < 0) {
      return Icons.arrow_drop_down;
    }
    if (change > 0) {
      return Icons.arrow_drop_up;
    }
    return Icons.radio_button_checked;
  }

  EdgeInsets getPadding() =>
      change == 0 ? const EdgeInsets.all(4.0) : EdgeInsets.zero;

  @override
  Widget build(BuildContext context) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(
                padding: getPadding(),
                child: Icon(getIconData(),
                    color: color, size: change == 0 ? 10 : 20)),
            Text(isDataLoaded ? change.abs().toString() : '...',
                maxLines: maxLines,
                overflow: textOverflow,
                style: textStyle.copyWith(color: color))
          ]);
}
