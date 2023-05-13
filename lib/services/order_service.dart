import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/models/order.dart';
import 'package:drone4u/services/user_orders_service.dart';

class OrderService {
  static CollectionReference get orderCollection =>
      FirebaseFirestore.instance.collection('orders');

  static CollectionReference get userBuyOrderCollection =>
      FirebaseFirestore.instance.collection('user-buy-orders');

  static CollectionReference get userSellOrderCollection =>
      FirebaseFirestore.instance.collection('user-sell-orders');

  static Future<List<SingleOrder>> getAllOrders() async {
    return [];
  }

  static Future<void> uploadOrder(SingleOrder? order) async {
    // set buyer order
    await userBuyOrderCollection.doc(order?.buyer?.userId).set({
      'orders': FieldValue.arrayUnion([order?.bookingId])
    }, SetOptions(merge: true));

    // set seller order
    await userSellOrderCollection.doc(order?.seller?.userId).set({
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

  static Future<Map<String, List<SingleOrder>>> retrieveAllOrders(
      String userId) async {
    List<String> buyOrders = await UserOrdersService.allBuyOrders();
    List<String> sellOrders = await UserOrdersService.allSellOrders();
    Map<String, List<SingleOrder>> allOrders = {
      "buyOrders": [],
      'sellOrders': [],
    };
    for (String orderId in buyOrders) {
      SingleOrder order = await getSingleOrder(orderId);
      allOrders['buyOrders']!.add(order);
    }

    for (String orderId in sellOrders) {
      SingleOrder order = await getSingleOrder(orderId);
      allOrders['sellOrders']!.add(order);
    }
    return allOrders;
  }
}
