import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/components/d4u_index.dart';
import 'package:drone4u/models/user.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class UserService {
  final String? documentName;
  final Map<String, dynamic>? data;

  UserService({this.documentName, this.data});

  static CollectionReference get userCollection =>
      FirebaseFirestore.instance.collection('users');

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

  static Future<SingleUser> getSingleUser(String documentName) async {
    SingleUser user = SingleUser();
    try {
      DocumentSnapshot snapshot = await userCollection.doc(documentName).get();
      user = SingleUser.fromJson(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
    }
    return user;
  }
}
