class SingleUser {
  String? name;
  String? userId;
  String? email;
  String? role;

  SingleUser({this.name, this.userId, this.email, this.role});

  SingleUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
