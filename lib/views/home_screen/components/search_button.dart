import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/views/home_screen/components/search_dialog.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(
      {super.key, required this.heroText, required this.searchType});
  final String heroText;
  final int searchType;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: MaterialButton(
          elevation: 10,
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Hero(
                  tag: heroText,
                  child: const Icon(Icons.search, color: Colors.white))),
          onPressed: () => showDialog(
              context: context,
              builder: (context) =>
                  SearchDialog(heroText: heroText, searchType: searchType))));
}
