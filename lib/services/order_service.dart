import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/models/order.dart';

class OrderService {
  static CollectionReference get orderCollection =>
      FirebaseFirestore.instance.collection('orders');

  static CollectionReference get userOrderCollection =>
      FirebaseFirestore.instance.collection('user-orders');

  static Future<List<SingleOrder>> getAllOrders() async {
    return [];
  }

  static Future<void> uploadOrder(SingleOrder? order) async {
    await userOrderCollection.doc(order?.buyer?.userId).set({
      'orders': FieldValue.arrayUnion([order?.bookingId])
    }, SetOptions(merge: true));
    return await orderCollection.doc(order?.bookingId).set(order?.toJson());
  }

  static Future<SingleOrder> getSingleOrder(String bookingId) {
    return orderCollection.doc(bookingId).get().then(
      (value) {
        return SingleOrder.fromJson(
          value.data() as Map<String, dynamic>,
          convertTimestamp: true,
        );
      },
    );
  }
}
