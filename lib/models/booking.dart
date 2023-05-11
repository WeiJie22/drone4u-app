class Booking {
  DateTime? startDate;
  DateTime? endDate;
  String? location;
  double? totalPrice;

  Booking({this.startDate, this.endDate, this.location, this.totalPrice});

  Booking.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
    location = json['location'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['location'] = this.location;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}
