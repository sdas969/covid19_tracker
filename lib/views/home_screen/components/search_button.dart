import 'package:covid19_tracker/utils/app_navigator.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        enableFeedback: true,
        tooltip: 'Search',
        icon: const Hero(
            tag: 'search', child: Icon(Icons.search, color: Colors.white)),
        onPressed: () => AppNavigator().push(context, Text('data')));
  }
}
