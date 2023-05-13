import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/models/product.dart';

class ProductService {
  final String? documentName;
  final Map<String, dynamic>? data;

  static int limit = 10;

  ProductService({this.documentName, this.data});

  static CollectionReference get productCollection =>
      FirebaseFirestore.instance.collection('products');

  static List<QueryDocumentSnapshot> productDocs = [];

  static Future<List<Product>> fetchFirstList() async {
    List<Product> products = [];
    try {
      final snapshot = await productCollection.limit(limit).get();
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
