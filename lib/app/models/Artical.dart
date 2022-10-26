class Article {
  String? sId;
  String? content;
  String? title;
  String? authorName;
  String? authorJob;
  String? target;
  int? points;
  bool? isPublished;
  List<dynamic>? sources;
  int? iV;

  Article.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    title = json['title'];
    authorName = json['authorName'];
    authorJob = json['authorJob'];
    target = json['target'];
    points = json['points'];
    isPublished = json['isPublished'];
    sources = json['sources'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['content'] = this.content;
    data['title'] = this.title;
    data['authorName'] = this.authorName;
    data['authorJob'] = this.authorJob;
    data['target'] = this.target;
    data['points'] = this.points;
    data['isPublished'] = this.isPublished;
    data['sources'] = this.sources;
    data['__v'] = this.iV;
    return data;
  }
}