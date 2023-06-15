import 'package:covid19_tracker/models/pair.dart';

class CountryTimeline {
  String? country;
  List<String>? province;
  Timeline? timeline;
  String? infoMsg;
  bool? success;

  CountryTimeline(
      {this.country, this.province, this.timeline, this.infoMsg, this.success});

  CountryTimeline.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    infoMsg = json['infoMsg'];
    success = json['success'];
    province = json['province'].cast<String>();
    timeline =
        json['timeline'] != null ? Timeline.fromJson(json['timeline']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['infoMsg'] = infoMsg;
    data['success'] = success;
    data['province'] = province;
    if (timeline != null) {
      data['timeline'] = timeline!.toJson();
    }
    return data;
  }
}

class Timeline {
  Cases? cases;
  Cases? deaths;
  Cases? recovered;

  Timeline({this.cases, this.deaths, this.recovered});

  Timeline.fromJson(Map<String, dynamic> json) {
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    deaths = json['deaths'] != null ? Cases.fromJson(json['deaths']) : null;
    recovered =
        json['recovered'] != null ? Cases.fromJson(json['recovered']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cases != null) {
      data['cases'] = cases!.toJson();
    }
    if (deaths != null) {
      data['deaths'] = deaths!.toJson();
    }
    if (recovered != null) {
      data['recovered'] = recovered!.toJson();
    }
    return data;
  }
}

class Cases {
  List<Pair<String, int>>? dataList;

  Cases({this.dataList});

  Cases.fromJson(Map<String, dynamic> json) {
    final data = <Pair<String, int>>[];
    json.forEach((key, value) => data.add(Pair(key, value)));
    dataList = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    for (Pair<String, int> element in dataList!) {
      data[element.date] = element.value;
    }
    return data;
  }
}
