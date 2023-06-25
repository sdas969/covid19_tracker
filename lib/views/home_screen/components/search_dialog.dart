import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key, required this.heroText});
  final String heroText;

  @override
  Widget build(BuildContext context) => Dialog(
          child: Scaffold(
              body: CustomScrollView(slivers: [
        CustomAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                stretchModes: stretchModes,
                centerTitle: true,
                background:
                    Hero(tag: heroText, child: const Icon(Icons.search)),
                expandedTitleScale: 1,
                titlePadding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                title: Container(
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: defaultBorderRadius))))),
            imgUrl: 'assets/Corona.png',
            titleString: 'Search'),
        SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) =>
                const ListTile(title: Text('hello')))
      ])));
}
