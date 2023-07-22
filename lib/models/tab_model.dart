import 'package:covid19_tracker/models/description_model.dart';

class TabModel {
  TabModel({required this.tabContentList, this.title = ''});
  final List<DescriptionModel> tabContentList;
  final String title;
}
