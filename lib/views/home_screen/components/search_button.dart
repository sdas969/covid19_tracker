import 'package:covid19_tracker/views/home_screen/components/search_dialog.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.heroText});
  final String heroText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        visualDensity: VisualDensity.compact,
        //alignment: Alignment.bottomCenter,
        enableFeedback: true,
        //tooltip: 'Search',
        child: Hero(
            tag: heroText,
            child: const Icon(Icons.search, color: Colors.white)),
        onPressed: () => showDialog(
            context: context,
            builder: (context) => SearchDialog(heroText: heroText)));
  }
}
