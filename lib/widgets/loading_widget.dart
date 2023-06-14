import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.textStyle});
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Text('...', style: textStyle);
}
