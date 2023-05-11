import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/models/order.dart';

class OrderService {
  CollectionReference get orderCollection =>
      FirebaseFirestore.instance.collection('orders');

  static Future<List<SingleOrder>> getOrders() async {
    return [];
  }
}
