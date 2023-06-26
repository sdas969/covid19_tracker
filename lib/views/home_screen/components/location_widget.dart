import 'package:covid19_tracker/enums/loading_state.dart';
import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/views/home_screen/components/search_button.dart';
import 'package:covid19_tracker/widgets/text_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key, this.titleSize = 30});
  final double titleSize;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      ListTile(title: Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.statsLoadingState != LoadingState.loaded ||
            countriesDataProvider.countryData == null) {
          return const TextLoadingWidget();
        }
        return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  (countriesDataProvider.currCountryState.second.isNotEmpty)
                      ? countriesDataProvider.currCountryState.second
                      : countriesDataProvider.currCountryState.first,
                  style: TextStyle(
                      fontSize: widget.titleSize, fontWeight: FontWeight.w900)),
              const SearchButton(heroText: 'search', searchType: 1)
            ]);
      }), subtitle: Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        if (countriesDataProvider.statsLoadingState != LoadingState.loaded) {
          return const TextLoadingWidget();
        }
        return (countriesDataProvider.currCountryState.second.isNotEmpty)
            ? Text(countriesDataProvider.currCountryState.first)
            : const SizedBox();
      }));
}
