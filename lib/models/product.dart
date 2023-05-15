class Product {
  String? id;
  String? name;
  String? description;
  String? sellerName;
  String? sellerId;
  double? price;
  List<dynamic>? categories;
  double? productRating;
  double? discountPrice;
  double? discountPercentage;
  bool? isDiscount;
  double? reviewCount;
  List<dynamic>? images;

  Product({
    this.id,
    this.name,
    this.description,
    this.sellerName,
    this.sellerId,
    this.price,
    this.categories,
    this.productRating,
    this.discountPrice,
    this.discountPercentage,
    this.isDiscount,
    this.reviewCount,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      sellerName: json['sellerName'],
      sellerId: json['sellerId'],
      price: json['price'],
      categories: json['categories'],
      productRating: json['productRating'],
      discountPrice: json['discountPrice'],
      discountPercentage: json['discountPercentage'],
      isDiscount: json['isDiscount'],
      reviewCount: json['reviewCount'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'sellerName': sellerName,
      'sellerId': sellerId,
      'price': price,
      'categories': categories,
      'productRating': productRating,
      'discountPrice': discountPrice,
      'discountPercentage': discountPercentage,
      'isDiscount': isDiscount,
      'reviewCount': reviewCount,
      'images': images,
    };
  }
}
