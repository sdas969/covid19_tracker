import 'package:covid19_tracker/constants/home_screen.dart';
import 'package:covid19_tracker/constants/universal.dart';
import 'package:covid19_tracker/models/country.dart';
import 'package:covid19_tracker/models/pair.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/app_navigator.dart';
import 'package:covid19_tracker/widgets/custom_app_bar.dart';
import 'package:covid19_tracker/widgets/fade_on_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog(
      {super.key, required this.heroText, required this.searchType});
  final String heroText;
  final int searchType;

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  late CountriesDataProvider _countriesDataProvider;
  late Country currCountry;
  late List<String> initStateList;
  late List<String> initCountryList;
  late List<String> countries;
  late List<String> states;
  late ScrollController _scrollController;
  @override
  void initState() {
    _countriesDataProvider =
        Provider.of<CountriesDataProvider>(context, listen: false);
    _scrollController = ScrollController();

    currCountry = _countriesDataProvider.countries!.firstWhere((element) =>
        element.name == _countriesDataProvider.currCountryState.first);
    initStateList = [currCountry.name!] +
        currCountry.states!.map((state) => state.name!).toList();
    initCountryList = _countriesDataProvider.countries!
        .map((country) => country.name!)
        .toList();
    countries = initCountryList;
    states = initStateList;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog(
      shape: cardShape,
      child: ClipRRect(
          borderRadius: defaultBorderRadius,
          child: Scaffold(
              body: CustomScrollView(controller: _scrollController, slivers: [
            CustomAppBar(
                expandedHeight: 300,
                collapsedHeight: 80,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                  return FlexibleSpaceBar(
                      stretchModes: stretchModes,
                      centerTitle: true,
                      background: FadeOnScroll(
                          zeroOpacityOffset: 150,
                          scrollController: _scrollController,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                  tag: widget.heroText,
                                  child: const Icon(Icons.search, size: 100)))),
                      expandedTitleScale: 1,
                      titlePadding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.1, vertical: 16),
                      title: Container(
                          alignment: Alignment.bottomCenter,
                          child: TextField(
                              onChanged: handleSearch,
                              decoration: InputDecoration(
                                  hintText: 'Search Here...',
                                  filled: true,
                                  fillColor: Colors.black,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 2),
                                      borderRadius: defaultBorderRadius)),
                              style: const TextStyle(fontSize: 14))));
                }),
                imgUrl: 'assets/Corona.png',
                titleString: 'Search'),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverList.builder(
                itemCount:
                    widget.searchType == 1 ? states.length : countries.length,
                itemBuilder: (context, index) => ListTile(
                    title: Text(widget.searchType == 1
                        ? states[index]
                        : countries[index]),
                    onTap: () => handleLocationChange(
                        _countriesDataProvider, states[index])))
          ]))));

  handleLocationChange(CountriesDataProvider states, String state) {
    Pair<String, String> location =
        Pair(_countriesDataProvider.currCountryState.first, '');
    if (state != _countriesDataProvider.currCountryState.first) {
      location.second = state;
    }
    _countriesDataProvider.changeLocation(location);
    AppNavigator().pop(context);
  }

  void handleSearch(String value) {
    final enteredString = value.toLowerCase().trim();
    setState(() {
      if (enteredString.isNotEmpty) {
        states = initStateList
            .where((element) => element.toLowerCase().contains(enteredString))
            .toList();
      } else {
        states = initStateList;
      }
    });
  }
}
