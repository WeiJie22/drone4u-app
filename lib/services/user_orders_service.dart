import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOrdersService {
  static CollectionReference userBuyOrders =
      FirebaseFirestore.instance.collection('user-buy-orders');

  static CollectionReference userSellOrders =
      FirebaseFirestore.instance.collection('user-sell-orders');

  static Future<List<String>> allBuyOrders() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    List<String> orders = [];
    return userBuyOrders.doc(userId).get().then((value) {
      if (value.exists) {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;
        orders = List.from(data['orders']);
      }
      return orders;
    });
  }

  static Future<List<String>> allSellOrders() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    List<String> orders = [];

    return userSellOrders.doc(userId).get().then((value) {
      if (value.exists) {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;
        orders = List.from(data['orders']);
      }
      return orders;
    });
  }
}
