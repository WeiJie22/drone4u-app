import 'package:drone4u/models/product.dart';
import 'package:drone4u/services/product_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageProductsProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Product>? products;
  Product? product;
  String? productId;

  ManageProductsProvider({this.productId}) {
    productId == null ? initData() : initEditProduct();
  }

  initData() async {
    isLoading = true;
    User currentUser = FirebaseAuth.instance.currentUser!;
    products = await ProductService.getSellerProducts(currentUser.uid);
    isLoading = false;
    notifyListeners();
  }

  initEditProduct() async {
    isLoading = true;
    product = await ProductService.getSingleProduct(productId!);
    isLoading = false;
    notifyListeners();
  }
}
