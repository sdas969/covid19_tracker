class Country {
  List<States>? states;
  String? name;

  Country({this.states, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (states != null) {
      data['states'] = states!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}

class States {
  String? name;
  double? long;
  String? country;
  double? lat;

  States({this.name, this.long, this.country, this.lat});

  States.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    long = json['long'];
    country = json['country'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['long'] = long;
    data['country'] = country;
    data['lat'] = lat;
    return data;
  }
}
