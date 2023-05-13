import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/models/order.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/models/user.dart';
import 'package:drone4u/screens/d4u_success_booking_page.dart';
import 'package:drone4u/services/order_service.dart';
import 'package:drone4u/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  User currentUser = FirebaseAuth.instance.currentUser!;

  bool isLoading = false;
  bool initAllOrders = false;
  late SingleUser seller;
  late SingleUser buyer;
  late SingleOrder? order;
  late Product? product;
  late Map<String, List<SingleOrder>> allOrders = {};
  late List<SingleOrder> buyOrders;
  late List<SingleOrder> sellOrders;
  late String? orderId;

  OrderProvider({
    this.order,
    this.product,
    this.initAllOrders = false,
    this.orderId,
  }) {
    isLoading = true;

    initAllOrders
        ? initAllOrdersData()
        : initData(order, product, orderId: orderId);
    isLoading = false;
  }

  initData(SingleOrder? initOrder, Product? product, {String? orderId}) async {
    if (orderId == null) {
      order = initOrder;
      seller = await UserService.getSingleUser(product?.sellerId ?? '');
      buyer = await UserService.getSingleUser(currentUser.uid);
      order?.buyer = buyer;
      order?.seller = seller;
      order?.product = product;
      order?.insurance = false;
      order?.orderDate = DateTime.now();
    } else {
      order = await OrderService.getSingleOrder(orderId);
    }

    notifyListeners();
  }

  initAllOrdersData() async {
    String currentUserUid = currentUser.uid;
    allOrders = await OrderService.retrieveAllOrders(currentUserUid);
    buyOrders = allOrders['buyOrders']!;
    sellOrders = allOrders['sellOrders']!;
    notifyListeners();
  }

  confirmBooking(context) async {
    order?.status = 'Pending';
    await OrderService.uploadOrder(order);
    Navigator.pop(context);
    Navigator.pushReplacementNamed(
      context,
      RouteName.successBookingPage,
      arguments: D4uSuccessBookingPageArgs(
        orderId: order?.bookingId,
      ),
    );
  }
}
