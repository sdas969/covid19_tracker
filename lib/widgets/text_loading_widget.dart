import 'package:flutter/material.dart';

class TextLoadingWidget extends StatelessWidget {
  const TextLoadingWidget({super.key, this.textStyle});
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Text('...', style: textStyle);
}
