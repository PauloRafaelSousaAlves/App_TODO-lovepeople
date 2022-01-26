class Atorizacao {
  String? authorization;

  Atorizacao({this.authorization});

  Atorizacao.fromJson(Map<String, dynamic> json) {
    this.authorization = json["Authorization"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Authorization"] = this.authorization;
    return data;
  }
}
