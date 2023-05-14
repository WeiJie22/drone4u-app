import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFavouriteService {
  static CollectionReference userFavouriteProducts =
      FirebaseFirestore.instance.collection('user-favourite-products');

  static setFavouriteProduct(String productId) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      await userFavouriteProducts.doc(userId).set({
        'products': FieldValue.arrayUnion([productId])
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  static getFavouriteProductsId() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      return await userFavouriteProducts.doc(userId).get().then((value) {
        if (value.exists) {
          Map<String, dynamic> data = value.data() as Map<String, dynamic>;
          return List.from(data['products']);
        }
        return [];
      });
    } catch (e) {
      print(e);
    }
  }
}
