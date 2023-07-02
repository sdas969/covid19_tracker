import 'package:covid19_tracker/views/home_screen/components/location_widget/location_widget_subtitle.dart';
import 'package:covid19_tracker/views/home_screen/components/location_widget/location_widget_title.dart';
import 'package:covid19_tracker/views/home_screen/components/search_button.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => ListTile(
      title: LocationWidgetTitle(titleSize: widget.titleSize),
      subtitle: const LocationWidgetSubtitle(),
      trailing: const SearchButton(heroText: 'search', searchType: 1));
}
