import 'package:drone4u/models/booking.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/models/user.dart';
import 'package:drone4u/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  User currentUser = FirebaseAuth.instance.currentUser!;

  bool isLoading = false;
  late SingleUser seller;
  late SingleUser buyer;
  late Booking booking;
  late Product product;

  BookingProvider(this.booking, this.product) {
    initData(booking, product);
  }

  initData(Booking initBooking, Product product) async {
    isLoading = true;
    booking = initBooking;
    seller = await UserService.getSingleUser(product.sellerId!);
    buyer = await UserService.getSingleUser(currentUser.uid);
    booking.buyer = buyer;
    booking.seller = seller;
    booking.product = product;
    booking.insurance = false;

    isLoading = false;
    notifyListeners();
  }
}
