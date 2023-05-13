class SingleUser {
  String? name;
  String? userId;
  String? email;
  String? role;
  String? address;

  SingleUser({this.name, this.userId, this.email, this.role, this.address});

  SingleUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
    email = json['email'];
    role = json['role'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['role'] = this.role;
    data['address'] = this.address;
    return data;
  }
}
