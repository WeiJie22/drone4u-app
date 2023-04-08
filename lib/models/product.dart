class Product {
  final String? name;
  final String? description;
  final String? sellerName;
  final String? price;
  final List<String>? categories;
  final double? productRating;
  final double? originalPrice;
  final double? discountPrice;
  final String? imagePath;
  final double? discountPercentage;
  final bool? isDiscount;
  final double? reviewCount;

  Product({
    this.name,
    this.description,
    this.sellerName,
    this.price,
    this.categories,
    this.productRating,
    this.originalPrice,
    this.discountPrice,
    this.imagePath,
    this.discountPercentage,
    this.isDiscount,
    this.reviewCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      sellerName: json['sellerName'],
      price: json['price'],
      categories: json['categories'],
      productRating: json['productRating'],
      originalPrice: json['originalPrice'],
      discountPrice: json['discountPrice'],
      imagePath: json['imagePath'],
      discountPercentage: json['discountPercentage'],
      isDiscount: json['isDiscount'],
      reviewCount: json['reviewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'sellerName': sellerName,
      'price': price,
      'categories': categories,
      'productRating': productRating,
      'originalPrice': originalPrice,
      'discountPrice': discountPrice,
      'imagePath': imagePath,
      'discountPercentage': discountPercentage,
      'isDiscount': isDiscount,
      'reviewCount': reviewCount,
    };
  }

  @override
  String toString() {
    return 'Product{name: $name, description: $description, sellerName: $sellerName, price: $price, categories: $categories, productRating: $productRating, originalPrice: $originalPrice, discountPrice: $discountPrice, imagePath: $imagePath, discountPercentage: $discountPercentage, isDiscount: $isDiscount, reviewCount: $reviewCount}';
  }
}
