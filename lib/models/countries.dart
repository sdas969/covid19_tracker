class Countries {
  List<String>? countryList;
  bool? success;
  String? infoMsg;

  Countries({this.countryList, this.infoMsg, this.success});

  Countries.fromJson(Map<String, dynamic> json) {
    countryList = json['countryList'].cast<String>();
    success = json['success'];
    infoMsg = json['infoMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryList'] = countryList;
    data['infoMsg'] = infoMsg;
    data['success'] = success;
    return data;
  }
}
