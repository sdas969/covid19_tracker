class GeoLocation {
  int? placeId;
  String? licence;
  String? poweredBy;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  String? displayName;
  Address? address;
  List<String>? boundingbox;
  String? infoMsg;
  bool? success;

  GeoLocation(
      {this.placeId,
      this.licence,
      this.poweredBy,
      this.osmType,
      this.infoMsg,
      this.success,
      this.osmId,
      this.lat,
      this.lon,
      this.displayName,
      this.address,
      this.boundingbox});

  GeoLocation.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    poweredBy = json['powered_by'];
    osmType = json['osm_type'];
    success = json['success'];
    infoMsg = json['infoMsg'];
    osmId = json['osm_id'];
    lat = json['lat'];
    lon = json['lon'];
    displayName = json['display_name'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    boundingbox = json['boundingbox'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['place_id'] = placeId;
    data['licence'] = licence;
    data['powered_by'] = poweredBy;
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['success'] = success;
    data['infoMsg'] = infoMsg;
    data['lat'] = lat;
    data['lon'] = lon;
    data['display_name'] = displayName;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['boundingbox'] = boundingbox;
    return data;
  }
}

class Address {
  String? county;
  String? stateDistrict;
  String? state;
  String? country;
  String? countryCode;

  Address(
      {this.county,
      this.stateDistrict,
      this.state,
      this.country,
      this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    county = json['county'];
    stateDistrict = json['state_district'];
    state = json['state'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['county'] = county;
    data['state_district'] = stateDistrict;
    data['state'] = state;
    data['country'] = country;
    data['country_code'] = countryCode;
    return data;
  }
}
