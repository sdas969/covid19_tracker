import 'package:covid19_tracker/models/state_model.dart';
import 'package:flutter/material.dart';

class CardTitleWidget extends StatelessWidget {
  const CardTitleWidget(
      {super.key,
      required this.state,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.textOverflow = TextOverflow.ellipsis,
      this.textStyle = const TextStyle()});
  final StateModel state;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final int maxLines;

  @override
  Widget build(BuildContext context) => Text(state.displayName,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: textOverflow,
      style: textStyle.copyWith(color: state.color));
}
