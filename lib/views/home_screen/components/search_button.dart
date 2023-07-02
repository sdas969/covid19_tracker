import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/views/home_screen/components/search_dialog.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(
      {super.key,
      required this.heroText,
      required this.searchType,
      this.extended = false});
  final String heroText;
  final int searchType;
  final bool extended;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: MaterialButton(
          elevation: 10,
          padding: extended ? null : const EdgeInsets.symmetric(horizontal: 2),
          shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
          child: extended
              ? ListTile(title: const Text('Search'), trailing: getSearchIcon())
              : getSearchIcon(),
          onPressed: () => showDialog(
              context: context,
              builder: (context) =>
                  SearchDialog(heroText: heroText, searchType: searchType))));

  Hero getSearchIcon() => Hero(tag: heroText, child: const Icon(Icons.search));
}
