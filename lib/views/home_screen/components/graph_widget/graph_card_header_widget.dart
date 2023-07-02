import 'package:covid19_tracker/providers/countries_data.dart';
import 'package:covid19_tracker/utils/is_timeline_fetched.dart';
import 'package:covid19_tracker/views/home_screen/components/graph_widget/customise_graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphCardHeaderWidget extends StatelessWidget {
  const GraphCardHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer<CountriesDataProvider>(
          builder: (context, countriesDataProvider, _) {
        String countryText = isTimelineFetched(context)
            ? countriesDataProvider.currTimelineCountry
            : '...';
        return ListTile(
            title: Text('Country Timeline : $countryText',
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blueAccent,
                    fontSize: 30)),
            trailing: const CustomiseGraphWidget());
      });
}
