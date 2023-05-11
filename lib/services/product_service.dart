import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/models/user.dart';
import 'package:drone4u/services/user_service.dart';
import 'package:flutter/material.dart';

import '../components/d4u_error_dialog.dart';
import '../main.dart';

class ProductService {
  final String? documentName;
  final Map<String, dynamic>? data;

  ProductService({this.documentName, this.data});

  static CollectionReference get productCollection =>
      FirebaseFirestore.instance.collection('products');

  // Future<void> set(String documentName, Map<String, dynamic> data) async {
  //   try {
  //     await productCollection.doc(documentName).set(data);
  //     showCrudDialog(
  //       titleMsg: 'Successful',
  //       contentMsg: 'Document set successfully',
  //       refresh: true,
  //     );
  //   } catch (e) {
  //     showCrudDialog(
  //         titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
  //   }
  // }

  // Future<void> get(String documentName) async {
  //   try {
  //     await productCollection.doc(documentName).get();
  //     showCrudDialog(
  //       titleMsg: 'Successful',
  //       contentMsg: 'Document get successfully',
  //     );
  //   } catch (e) {
  //     showCrudDialog(
  //         titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
  //   }
  // }

  // Future<void> update(String documentName, Map<String, dynamic> data) async {
  //   try {
  //     await productCollection.doc(documentName).update(data);
  //     showCrudDialog(
  //       titleMsg: 'Successful',
  //       contentMsg: 'Document update successfully',
  //     );
  //   } catch (e) {
  //     showCrudDialog(
  //         titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
  //   }
  // }

  // Future<void> delete() async {
  //   try {
  //     await productCollection.doc(documentName).delete();
  //     showCrudDialog(
  //       titleMsg: 'Successful',
  //       contentMsg: 'Document delete successfully',
  //     );
  //   } catch (e) {
  //     showCrudDialog(
  //         titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
  //   }
  // }

  static Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    try {
      final snapshot = await productCollection.get();
      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          products
              .add(Product.fromJson(element.data() as Map<String, dynamic>));
        }
      }
    } catch (e) {
      print(e);
    }
    return products;
  }

  // void showCrudDialog(
  //     {required String titleMsg, String? contentMsg, bool? refresh}) {
  //   showDialog(
  //     context: navigatorKey.currentState!.overlay!.context,
  //     builder: (context) => D4uErrorDialog(
  //       title: titleMsg,
  //       content: contentMsg,
  //       refresh: refresh ?? false,
  //     ),
  //   );
  // }
}
