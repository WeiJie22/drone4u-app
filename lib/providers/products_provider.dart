import 'package:drone4u/constant/home_page_contant.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Product>? _products;
  List<Product>? _filteredProducts;

  List<Product>? get products => _products;
  List<Product>? get filteredProducts => _filteredProducts;

  set products(List<Product>? products) {
    _products = products;
    notifyListeners();
  }

  ProductProvider() {
    initData();
  }

  initData() async {
    isLoading = true;
    print('Refreshing');
    products = await ProductService.getAllProducts();
    isLoading = false;
  }

  filterProducts(String query) {
    _filteredProducts = products
        ?.where((element) => element.categories!.contains(query))
        .toList();
    notifyListeners();
  }

  onSearchChanged(String searchQuery) {
    products = productMockDataList
        .where((element) =>
            element.name!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
