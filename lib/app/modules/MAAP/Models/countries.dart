class Countries {
  String? name;
  String? phonecode;
  String? isoCode;

  Countries({this.name, this.phonecode, this.isoCode});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phonecode = json['phonecode'];
    isoCode = json['isoCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phonecode'] = this.phonecode;
    data['isoCode'] = this.isoCode;
    return data;
  }
}