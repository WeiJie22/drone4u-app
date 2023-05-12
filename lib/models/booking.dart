import 'package:drone4u/models/product.dart';
import 'package:drone4u/models/user.dart';

class Booking {
  String? bookingId;
  DateTime? startDate;
  DateTime? endDate;
  String? location;
  double? totalPrice;
  SingleUser? seller;
  SingleUser? buyer;
  Product? product;
  bool? insurance;

  Booking({
    this.bookingId,
    this.startDate,
    this.endDate,
    this.location,
    this.totalPrice,
    this.buyer,
    this.seller,
    this.product,
    this.insurance,
  });

  Booking.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    location = json['location'];
    totalPrice = json['totalPrice'];
    insurance = json['insurance'];
    if (buyer != null) {
      buyer = SingleUser.fromJson(json['buyer']);
    }
    if (seller != null) {
      seller = SingleUser.fromJson(json['seller']);
    }
    if (product != null) {
      product = Product.fromJson(json['product']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = bookingId;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['location'] = location;
    data['totalPrice'] = totalPrice;
    data['insurance'] = insurance;
    if (buyer != null) {
      data['buyer'] = buyer?.toJson();
    }
    if (seller != null) {
      data['seller'] = seller?.toJson();
    }
    if (product != null) {
      data['product'] = product?.toJson();
    }
    return data;
  }
}
