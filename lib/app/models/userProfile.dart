class UserProfile {
  String? name;
  String? email;
  String? surname;
  String? country;
  String? state;
  String? birthdate;
  String? jobDescription;

  UserProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    surname = json['surname'];
    country = json['country'];
    state = json['state'];
    birthdate = json['birthdate'];
    jobDescription = json['jobDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['surname'] = this.surname;
    data['country'] = this.country;
    data['state'] = this.state;
    data['birthdate'] = this.birthdate;
    data['jobDescription'] = this.jobDescription;
    return data;
  }
}