import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/services/user_favourite_service.dart';

class ProductService {
  final String? documentName;
  final Map<String, dynamic>? data;

  static int limit = 10;

  ProductService({this.documentName, this.data});

  static CollectionReference get productCollection =>
      FirebaseFirestore.instance.collection('products');

  static List<QueryDocumentSnapshot> productDocs = [];

  static Future<List<Product>> initProducts({String? query}) async {
    List<Product> products = [];
    try {
      QuerySnapshot snapshot;

      if (query == null) {
        snapshot = await productCollection.limit(limit).get();
      } else {
        snapshot = await productCollection
            .where('name', isGreaterThanOrEqualTo: query)
            .get();
      }

      productDocs.addAll(snapshot.docs);
      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          products
              .add(Product.fromJson(element.data() as Map<String, dynamic>));
        }
      }
    } catch (e) {
      print(e);
    }
    return products;
  }

  static Future<List<Product>> retrieveFavouriteProducts() async {
    List productIds = await UserFavouriteService.getFavouriteProductsId();
    List<Product> products = [];
    try {
      for (var productId in productIds) {
        final snapshot =
            await productCollection.where('id', isEqualTo: productId).get();
        if (snapshot.docs.isNotEmpty) {
          products.add(Product.fromJson(
              snapshot.docs.first.data() as Map<String, dynamic>));
        }
      }
    } catch (e) {
      print(e);
    }
    return products;
  }

  static Future<List<Product>> fetchNewList() async {
    List<Product> products = [];
    try {
      final snapshot = await productCollection
          .startAfterDocument(productDocs[productDocs.length - 1])
          .limit(limit)
          .get();
      productDocs.addAll(snapshot.docs);
      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          products
              .add(Product.fromJson(element.data() as Map<String, dynamic>));
        }
      }
    } catch (e) {
      print(e);
    }
    return products;
  }
}
