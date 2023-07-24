import 'package:covid19_tracker/models/state_model.dart';
import 'package:covid19_tracker/views/home_screen/components/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardContentWidget extends StatefulWidget {
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

  @override
  State<CardContentWidget> createState() => _CardContentWidgetState();
}

class _CardContentWidgetState extends State<CardContentWidget> {
  String formatData(BoxConstraints constraints) {
    bool isOverflowing = false;
    final textSpan = TextSpan(
        text: widget.data[widget.state.name].toString() +
            (widget.state.override && widget.state.isPercentage! ? ' %' : ''),
        style: widget.textStyle);
    final textPainter = TextPainter(
        text: textSpan, textDirection: Directionality.of(context), maxLines: 1);
    textPainter.layout(maxWidth: constraints.maxWidth);
    final isOverflowingNow = textPainter.didExceedMaxLines;
    isOverflowing = isOverflowingNow;
    final formatter = NumberFormat.compact();

    if (widget.state.override) {
      if (isOverflowing) {
        return ((widget.data[widget.state.numerator] /
                        widget.data[widget.state.denominator]) *
                    (widget.state.isPercentage! ? 1 : 0) *
                    100 as double)
                .round()
                .toStringAsFixed(0) +
            (widget.state.isPercentage! ? ' %' : '');
      }
      return ((widget.data[widget.state.numerator] /
                      widget.data[widget.state.denominator]) *
                  (widget.state.isPercentage! ? 1 : 0) *
                  100 as double)
              .toStringAsFixed(2) +
          (widget.state.isPercentage! ? ' %' : '');
    }
    if (isOverflowing) {
      final formattedStat =
          formatter.format((widget.data[widget.state.name] as double));
      final formattedNum =
          double.parse(formattedStat.substring(0, formattedStat.length - 1))
              .round()
              .toString();
      final formattedUnit = formattedStat[formattedStat.length - 1];
      return formattedNum + formattedUnit;
    }
    return widget.data[widget.state.name].toString();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            return Text(widget.isDataLoaded ? formatData(constraints) : '...',
                maxLines: widget.maxLines,
                overflow: widget.textOverflow,
                textAlign: widget.textAlign,
                style: widget.textStyle.copyWith(color: widget.state.color));
          })),
          if (widget.state.showIncrement)
            IncrementDecrementWidget(
                change: widget.data[widget.state.subtitle],
                isDataLoaded: widget.isDataLoaded,
                color: widget.state.color)
        ]);
  }
}
