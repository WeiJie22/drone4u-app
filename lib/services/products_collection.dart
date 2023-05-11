import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/d4u_error_dialog.dart';
import '../main.dart';

class ProductsCollection {
  final String? documentName;
  final Map<String, dynamic>? data;

  ProductsCollection({this.documentName, this.data});

  CollectionReference get userCollection =>
      FirebaseFirestore.instance.collection('products');

  Future<void> set(String documentName, Map<String, dynamic> data) async {
    try {
      await userCollection.doc(documentName).set(data);
      showCrudDialog(
        titleMsg: 'Successful',
        contentMsg: 'Document set successfully',
        refresh: true,
      );
    } catch (e) {
      showCrudDialog(
          titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
    }
  }

  Future<void> get(String documentName) async {
    try {
      await userCollection.doc(documentName).get();
      showCrudDialog(
        titleMsg: 'Successful',
        contentMsg: 'Document get successfully',
      );
    } catch (e) {
      showCrudDialog(
          titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
    }
  }

  Future<void> update(String documentName, Map<String, dynamic> data) async {
    try {
      await userCollection.doc(documentName).update(data);
      showCrudDialog(
        titleMsg: 'Successful',
        contentMsg: 'Document update successfully',
      );
    } catch (e) {
      showCrudDialog(
          titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
    }
  }

  Future<void> delete() async {
    try {
      await userCollection.doc(documentName).delete();
      showCrudDialog(
        titleMsg: 'Successful',
        contentMsg: 'Document delete successfully',
      );
    } catch (e) {
      showCrudDialog(
          titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
    }
  }

  static Future<void> readAll(String collectionName) async {
    final snapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();
    snapshot.docs.forEach((doc) {
      print(doc.id);
      print(doc.data());
    });
  }

  void showCrudDialog(
      {required String titleMsg, String? contentMsg, bool? refresh}) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) => D4uErrorDialog(
        title: titleMsg,
        content: contentMsg,
        refresh: refresh ?? false,
      ),
    );
  }
}
