import 'package:drone4u/models/order.dart';
import 'package:flutter/material.dart';

class OrdersProvider extends ChangeNotifier {
  List<SingleOrder> _orders = [];

  List<SingleOrder> get orders => _orders;

  void addOrder(SingleOrder order) {
    _orders.add(order);
    notifyListeners();
  }
}
