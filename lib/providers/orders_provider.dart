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
  late List<SingleOrder> allOrders;
  late String? orderId;

  OrderProvider({
    this.order,
    this.product,
    this.initAllOrders = false,
    this.orderId,
  }) {
    initAllOrders
        ? initAllOrdersData()
        : initData(order, product, orderId: orderId);
  }

  initData(SingleOrder? initOrder, Product? product, {String? orderId}) async {
    isLoading = true;
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

    isLoading = false;
    notifyListeners();
  }

  initAllOrdersData() {
    String currentUserUid = currentUser.uid;

    isLoading = true;
    allOrders = [];
    isLoading = false;
    notifyListeners();
  }

  confirmBooking(context) async {
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
