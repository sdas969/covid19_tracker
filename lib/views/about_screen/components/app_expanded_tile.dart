import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/providers/expansion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppExpandedTile extends StatelessWidget {
  const AppExpandedTile(
      {super.key,
      required this.description,
      required this.title,
      required this.index});
  final String title;
  final String description;
  final int index;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          shape: cardShape,
          elevation: 5,
          child: ClipRRect(
              borderRadius: defaultBorderRadius,
              child: Consumer<ExpansionProvider>(
                  builder: (context, expansionProvider, _) => ExpansionTile(
                          shape: cardShape,
                          controller: expansionProvider.controllers[index],
                          collapsedShape: cardShape,
                          onExpansionChanged: (value) =>
                              expansionProvider.setIndex(value ? index : -1),
                          title: Title(
                              color: Theme.of(context).colorScheme.primary,
                              child: Text(title)),
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(description,
                                    style: const TextStyle(fontSize: 16)))
                          ])))));
}
