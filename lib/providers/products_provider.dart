import 'package:drone4u/models/product.dart';
import 'package:drone4u/services/product_service.dart';
import 'package:drone4u/services/user_favourite_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  bool canLoadMore = true;
  bool initFavourite = false;
  List<Product>? _products;
  List<Product>? _favouriteProducts;
  List<String> _favouriteProductIds = [];

  List<Product>? get products => _products;
  List<Product>? get favouriteProducts => _favouriteProducts;
  List<String> get favouriteProductIds => _favouriteProductIds;

  set products(List<Product>? products) {
    _products = products;
    notifyListeners();
  }

  set favouriteProducts(List<Product>? products) {
    _favouriteProducts = products;
    notifyListeners();
  }

  set favouriteProductIds(List<String> ids) {
    _favouriteProductIds = ids;
    notifyListeners();
  }

  ProductProvider({this.initFavourite = false}) {
    !initFavourite ? initData() : getFavouriteProducts();
  }

  initData() async {
    canLoadMore = true;
    isLoading = true;
    favouriteProductIds = await UserFavouriteService.getFavouriteProductsId();
    products = await ProductService.initProducts();
    isLoading = false;
    notifyListeners();
  }

  setFavourite(String productId) async {
    favouriteProductIds =
        await UserFavouriteService.setFavouriteProduct(productId);
    getFavouriteProducts();
    notifyListeners();
  }

  removeFavourite(String productId) async {
    favouriteProductIds =
        await UserFavouriteService.removeFavouriteProduct(productId);
    getFavouriteProducts();
    notifyListeners();
  }

  checkFav(String productId) {
    return favouriteProductIds.contains(productId);
  }

  getFavouriteProducts() async {
    isLoading = true;
    favouriteProducts = await ProductService.retrieveFavouriteProducts();
    isLoading = false;
  }

  loadMore() async {
    List<Product> newProducts = await ProductService.fetchNewList();
    newProducts.isEmpty ? canLoadMore = false : canLoadMore = true;
    products?.addAll(newProducts);
    notifyListeners();
  }

  onSearchChanged(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      products = await ProductService.initProducts(query: searchQuery);
      canLoadMore = false;
    } else {
      canLoadMore = true;
      products = await ProductService.initProducts();
    }
    notifyListeners();
  }

  filterProduct(Map<String, dynamic> filters) async {
    isLoading = true;
    products = await ProductService.filterProducts(filters);
    isLoading = false;
    notifyListeners();
  }
}
