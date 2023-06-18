import 'dart:math';

import 'package:covid19_tracker/constants/home_screen.dart';
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
  List<Pair<DateTime, int>>? dataList;
  List<Pair<DateTime, int>>? diffDataList;

  Cases({this.dataList});

  Cases.fromJson(Map<String, dynamic> json) {
    List<Pair<DateTime, int>> data = <Pair<DateTime, int>>[];
    json.forEach((key, value) {
      if (data.isEmpty) {
        data.add(Pair(timelineDateFormat.parse(key), value));
      } else {
        data.add(
            Pair(timelineDateFormat.parse(key), max(value, data.last.value)));
      }
    });
    dataList = piecewiseAggregation(data, 20);
    diffDataList = <Pair<DateTime, int>>[];
    for (int index = 1; index < data.length; index++) {
      final diffData =
          Pair(data[index].date, data[index].value - data[index - 1].value);

      diffDataList!.add(diffData);
    }
    diffDataList = piecewiseAggregation(diffDataList!, 20);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    for (Pair<DateTime, int> element in dataList!) {
      data[timelineDateFormat.format(element.date)] = element.value;
    }
    return data;
  }

  List<Pair<DateTime, int>> piecewiseAggregation(
      List<Pair<DateTime, int>> data, int segments) {
    if (data.length <= segments) {
      return data;
    }

    final int segmentSize = (data.length / segments).ceil();

    List<Pair<DateTime, int>> reducedData = [];

    for (int i = 0; i < data.length; i += segmentSize) {
      int endIndex = i + segmentSize;
      if (endIndex >= data.length) {
        endIndex = data.length - 1;
      }

      List<Pair<DateTime, int>> segment = data.sublist(i, endIndex);
      Pair<DateTime, int> aggregateValue = computeAggregateValue(segment);

      reducedData.add(aggregateValue);
    }

    return reducedData;
  }

  Pair<DateTime, int> computeAggregateValue(List<Pair<DateTime, int>> segment) {
    DateTime segmentStart = segment.first.date;

    Pair<DateTime, int> maxPair =
        segment.reduce((a, b) => a.value > b.value ? a : b);

    Pair<DateTime, int> aggregateValue =
        Pair<DateTime, int>(segmentStart, maxPair.value);

    return aggregateValue;
  }
}
