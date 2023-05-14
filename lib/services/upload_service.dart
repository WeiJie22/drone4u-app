import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/models/product.dart';
import 'package:drone4u/models/user.dart';
import 'package:drone4u/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UploadService {
  static User user = FirebaseAuth.instance.currentUser!;

  static Future uploadFile(Map<String, dynamic> json) async {
    // for (int i = 0; i < 15; i++) {
    try {
      Map<String, dynamic> formValues = {...json};
      List<String> images = [];

      if (json[UploadServiceConstant.servicePictures] != null) {
        for (var image in json[UploadServiceConstant.servicePictures]) {
          String url = await uploadImage(image);
          images.add(url);
        }
      }

      // Set default value for the product
      formValues[UploadServiceConstant.servicePictures] = images;
      formValues['sellerId'] = user.uid;
      SingleUser currentUser = await UserService.getSingleUser(user.uid);
      formValues['sellerName'] = currentUser.name;
      formValues['price'] = double.tryParse(formValues['price']);
      formValues['categories'] =
          ['Big Drone', "Small Drone"].take(Random().nextInt(2) + 1).toList();
      formValues['isFavourite'] = false;
      formValues['isDiscount'] = false;

      Product newProduct = Product.fromJson(formValues);
      DocumentReference newDoc = await FirebaseFirestore.instance
          .collection('products')
          .add(newProduct.toJson());
      newDoc.set({'id': newDoc.id}, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
    // }
  }

  static Future<String> uploadImage(image) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference refImage = referenceDirImages.child(const Uuid().v4());

    try {
      await refImage.putFile(File(image!.path));
      final String url = await refImage.getDownloadURL();
      return url;
    } catch (e) {
      print(e);
    }
    return '';
  }
}
