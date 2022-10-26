class States {
  String? name;
  String? countryCode;

  States({this.name, this.countryCode});

  States.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    return data;
  }
}