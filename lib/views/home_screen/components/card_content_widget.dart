import 'package:covid19_tracker/models/state_model.dart';
import 'package:covid19_tracker/views/home_screen/components/increment_decrement_widget.dart';
import 'package:flutter/material.dart';

class CardContentWidget extends StatelessWidget {
  const CardContentWidget(
      {super.key,
      required this.state,
      required this.isDataLoaded,
      this.textAlign = TextAlign.start,
      this.maxLines = 1,
      this.textOverflow = TextOverflow.ellipsis,
      this.textStyle =
          const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
      required this.data});
  final StateModel state;
  final bool isDataLoaded;
  final Map<String, dynamic> data;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int maxLines;

  String formatData() {
    if (state.override) {
      return ((data[state.numerator] / data[state.denominator]) *
                  (state.isPercentage! ? 1 : 0) *
                  100 as double)
              .toStringAsFixed(2) +
          (state.isPercentage! ? ' %' : '');
    }
    return data[state.name].toString();
  }

  @override
  Widget build(BuildContext context) => Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(isDataLoaded ? formatData() : '...',
                    maxLines: maxLines,
                    overflow: textOverflow,
                    textAlign: textAlign,
                    style: textStyle.copyWith(color: state.color))),
            if (state.showIncrement)
              IncrementDecrementWidget(
                  change: data[state.subtitle],
                  isDataLoaded: isDataLoaded,
                  color: state.color)
          ]);
}
