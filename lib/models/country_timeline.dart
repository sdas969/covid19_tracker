import 'package:cloud_firestore/cloud_firestore.dart';

class CountryTimeline {
  double? long;
  List<CaseType>? recovered;
  List<CaseType>? cases;
  String? country;
  List<CaseType>? deaths;
  double? lat;

  CountryTimeline(
      {this.long,
      this.recovered,
      this.cases,
      this.country,
      this.deaths,
      this.lat});

  CountryTimeline.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    if (json['recovered'] != null) {
      recovered = <CaseType>[];
      json['recovered'].forEach((v) {
        recovered!.add(CaseType.fromJson(v));
      });
    }
    if (json['cases'] != null) {
      cases = <CaseType>[];
      json['cases'].forEach((v) {
        cases!.add(CaseType.fromJson(v));
      });
    }
    country = json['country'];
    if (json['deaths'] != null) {
      deaths = <CaseType>[];
      json['deaths'].forEach((v) {
        deaths!.add(CaseType.fromJson(v));
      });
    }
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long'] = long;
    if (recovered != null) {
      data['recovered'] = recovered!.map((v) => v.toJson()).toList();
    }
    if (cases != null) {
      data['cases'] = cases!.map((v) => v.toJson()).toList();
    }
    data['country'] = country;
    if (deaths != null) {
      data['deaths'] = deaths!.map((v) => v.toJson()).toList();
    }
    data['lat'] = lat;
    return data;
  }
}

class CaseType {
  int? value;
  DateTime? date;

  CaseType({this.value, this.date});

  CaseType.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    date = (json['date'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['date'] = Timestamp.fromDate(date!);
    return data;
  }
}
