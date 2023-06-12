class CountryData {
  int? updated;
  Total? total;
  List<States>? states;
  String? infoMsg;
  bool? success;

  CountryData(
      {this.updated, this.total, this.states, this.infoMsg, this.success});

  CountryData.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    infoMsg = json['infoMsg'];
    success = json['success'];
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
    data['success'] = success;
    data['infoMsg'] = infoMsg;
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
  int? active;
  int? recovered;
  int? deaths;
  int? cases;
  int? todayActive;
  int? todayRecovered;
  int? todayDeaths;
  int? todayCases;

  Total(
      {this.active,
      this.recovered,
      this.deaths,
      this.cases,
      this.todayActive,
      this.todayRecovered,
      this.todayDeaths,
      this.todayCases});

  Total.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    recovered = json['recovered'];
    deaths = json['deaths'];
    cases = json['cases'];
    todayActive = json['todayActive'];
    todayRecovered = json['todayRecovered'];
    todayDeaths = json['todayDeaths'];
    todayCases = json['todayCases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active'] = active;
    data['recovered'] = recovered;
    data['deaths'] = deaths;
    data['cases'] = cases;
    data['todayActive'] = todayActive;
    data['todayRecovered'] = todayRecovered;
    data['todayDeaths'] = todayDeaths;
    data['todayCases'] = todayCases;
    return data;
  }
}

class States {
  String? state;
  int? active;
  int? recovered;
  int? deaths;
  int? cases;
  int? todayActive;
  int? todayRecovered;
  int? todayDeaths;
  int? todayCases;

  States(
      {this.state,
      this.active,
      this.recovered,
      this.deaths,
      this.cases,
      this.todayActive,
      this.todayRecovered,
      this.todayDeaths,
      this.todayCases});

  States.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    active = json['active'];
    recovered = json['recovered'];
    deaths = json['deaths'];
    cases = json['cases'];
    todayActive = json['todayActive'];
    todayRecovered = json['todayRecovered'];
    todayDeaths = json['todayDeaths'];
    todayCases = json['todayCases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['active'] = active;
    data['recovered'] = recovered;
    data['deaths'] = deaths;
    data['cases'] = cases;
    data['todayActive'] = todayActive;
    data['todayRecovered'] = todayRecovered;
    data['todayDeaths'] = todayDeaths;
    data['todayCases'] = todayCases;
    return data;
  }
}
