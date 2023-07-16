import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichText(
          text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: const [
            TextSpan(text: 'Made with '),
            WidgetSpan(child: Icon(Icons.favorite, color: Colors.red)),
            TextSpan(text: ' by Smarajit Das.')
          ])));
}
