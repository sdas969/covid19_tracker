import 'package:cloud_firestore/cloud_firestore.dart';

class CountryData {
  DateTime? updated;
  Total? total;
  List<States>? states;

  CountryData({this.updated, this.total, this.states});

  CountryData.fromJson(Map<String, dynamic> json) {
    updated = (json['updated'] as Timestamp).toDate();
    total = json['total'] != null ? Total.fromJson(json['total']) : null;
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated'] = updated;
    if (total != null) {
      data['total'] = total!.toJson();
    }
    if (states != null) {
      data['states'] = states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Total {
  int? recovered;
  int? todayActive;
  int? active;
  int? deaths;
  int? todayRecovered;
  int? todayDeaths;
  int? cases;
  int? todayCases;

  Total(
      {this.recovered,
      this.todayActive,
      this.active,
      this.deaths,
      this.todayRecovered,
      this.todayDeaths,
      this.cases,
      this.todayCases});

  Total.fromJson(Map<String, dynamic> json) {
    recovered = json['recovered'];
    todayActive = json['todayActive'];
    active = json['active'];
    deaths = json['deaths'];
    todayRecovered = json['todayRecovered'];
    todayDeaths = json['todayDeaths'];
    cases = json['cases'];
    todayCases = json['todayCases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recovered'] = recovered;
    data['todayActive'] = todayActive;
    data['active'] = active;
    data['deaths'] = deaths;
    data['todayRecovered'] = todayRecovered;
    data['todayDeaths'] = todayDeaths;
    data['cases'] = cases;
    data['todayCases'] = todayCases;
    return data;
  }
}

class States {
  double? lat;
  int? cases;
  double? long;
  String? state;
  int? todayCases;
  int? deaths;
  int? todayActive;
  int? todayRecovered;
  int? todayDeaths;
  int? recovered;
  int? active;

  States(
      {this.lat,
      this.cases,
      this.long,
      this.state,
      this.todayCases,
      this.deaths,
      this.todayActive,
      this.todayRecovered,
      this.todayDeaths,
      this.recovered,
      this.active});

  States.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    cases = json['cases'];
    long = json['long'];
    state = json['state'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayActive = json['todayActive'];
    todayRecovered = json['todayRecovered'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['cases'] = cases;
    data['long'] = long;
    data['state'] = state;
    data['todayCases'] = todayCases;
    data['deaths'] = deaths;
    data['todayActive'] = todayActive;
    data['todayRecovered'] = todayRecovered;
    data['todayDeaths'] = todayDeaths;
    data['recovered'] = recovered;
    data['active'] = active;
    return data;
  }
}
