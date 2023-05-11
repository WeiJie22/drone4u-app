class SingleOrder {
  String? orderId;
  String? orderBy;
  num? orderDate;
  num? serviceStartDate;
  num? serviceEndDate;
  String? address;
  String? productId;
  num? price;
  String? status;
  String? desc;

  SingleOrder(
      {this.orderId,
      this.orderBy,
      this.orderDate,
      this.serviceStartDate,
      this.serviceEndDate,
      this.address,
      this.productId,
      this.price,
      this.status,
      this.desc});

  SingleOrder.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderBy = json['orderBy'];
    orderDate = json['orderDate'];
    serviceStartDate = json['serviceStartDate'];
    serviceEndDate = json['serviceEndDate'];
    address = json['address'];
    productId = json['productId'];
    price = json['price'];
    status = json['status'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderBy'] = this.orderBy;
    data['orderDate'] = this.orderDate;
    data['serviceStartDate'] = this.serviceStartDate;
    data['serviceEndDate'] = this.serviceEndDate;
    data['address'] = this.address;
    data['productId'] = this.productId;
    data['price'] = this.price;
    data['status'] = this.status;
    data['desc'] = this.desc;
    return data;
  }
}
