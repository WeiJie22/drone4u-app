class User {
  String? username;
  String? userId;
  String? email;
  String? role;

  User({this.username, this.userId, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userId = json['userId'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
