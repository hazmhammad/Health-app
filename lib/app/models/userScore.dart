class UserScore {
  int? total;
  Score? score;

  UserScore({this.total, this.score});

  UserScore.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    return data;
  }
}

class Score {
  int? body;
  int? mind;
  int? environment;
  int? spirit;
  int? ehr;

  Score({this.body, this.mind, this.environment, this.spirit, this.ehr});

  Score.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    mind = json['mind'];
    environment = json['environment'];
    spirit = json['spirit'];
    ehr = json['ehr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['mind'] = this.mind;
    data['environment'] = this.environment;
    data['spirit'] = this.spirit;
    data['ehr'] = this.ehr;
    return data;
  }
}