import 'package:drone4u/models/product.dart';
import 'package:drone4u/models/user.dart';

class SingleOrder {
  String? bookingId;
  DateTime? orderDate;
  DateTime? startDate;
  DateTime? endDate;
  String? location;
  double? totalPrice;
  SingleUser? seller;
  SingleUser? buyer;
  Product? product;
  bool? insurance;
  String? status;
  bool convertTimestamp;

  SingleOrder({
    this.bookingId,
    this.startDate,
    this.endDate,
    this.location,
    this.totalPrice,
    this.buyer,
    this.seller,
    this.product,
    this.insurance,
    this.orderDate,
    this.status,
    this.convertTimestamp = false,
  });

  SingleOrder.fromJson(Map<String, dynamic> json,
      {this.convertTimestamp = false}) {
    bookingId = json['bookingId'];
    startDate =
        convertTimestamp ? json['startDate'].toDate() : json['startDate'];
    endDate = convertTimestamp ? json['endDate'].toDate() : json['endDate'];
    orderDate =
        convertTimestamp ? json['orderDate'].toDate() : json['orderDate'];
    location = json['location'];
    status = json['status'];
    totalPrice = json['totalPrice'];
    insurance = json['insurance'];
    if (json['buyer'] != null) {
      buyer = SingleUser.fromJson(json['buyer']);
    }
    if (json['seller'] != null) {
      seller = SingleUser.fromJson(json['seller']);
    }
    if (json['product'] != null) {
      product = Product.fromJson(json['product']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = bookingId;
    data['startDate'] = startDate;
    data['orderDate'] = orderDate;
    data['endDate'] = endDate;
    data['status'] = status;
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
