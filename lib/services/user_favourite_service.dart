import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFavouriteService {
  static CollectionReference userFavouriteProducts =
      FirebaseFirestore.instance.collection('user-favourite-products');

  static CollectionReference get productCollection =>
      FirebaseFirestore.instance.collection('products');

  static Future<List<String>> setFavouriteProduct(String productId) async {
    List<String> productIds = [];
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      await userFavouriteProducts.doc(userId).set({
        'products': FieldValue.arrayUnion([productId])
      }, SetOptions(merge: true));
      productIds = await getFavouriteProductsId();
    } catch (e) {
      print(e);
    }
    return productIds;
  }

  static Future<List<String>> removeFavouriteProduct(String productId) async {
    List<String> productIds = [];
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      await userFavouriteProducts.doc(userId).set({
        'products': FieldValue.arrayRemove([productId])
      }, SetOptions(merge: true));
      productIds = await getFavouriteProductsId();
    } catch (e) {
      print(e);
    }
    return productIds;
  }

  static getFavouriteProductsId() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      return await userFavouriteProducts.doc(userId).get().then((value) {
        if (value.exists) {
          Map<String, dynamic> data = value.data() as Map<String, dynamic>;
          return List<String>.from(data['products']);
        }
        return <String>[];
      });
    } catch (e) {
      print(e);
    }
  }
}
