import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone4u/constant/form_constant.dart';
import 'package:drone4u/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadService {
  static Future uploadFile(Map<String, dynamic> json) async {
    Map<String, dynamic> formValues = {...json};
    List<String> images = [];

    if (json[UploadServiceConstant.servicePictures] != null) {
      for (var image in json[UploadServiceConstant.servicePictures]) {
        String url = await uploadImage(image);
        images.add(url);
      }
    }

    formValues[UploadServiceConstant.servicePictures] = images;
    Product newProduct = Product.fromJson(formValues);
    FirebaseFirestore.instance
        .collection('products')
        .doc('testing')
        .set(newProduct.toJson());
  }

  static Future<String> uploadImage(XFile? image) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference refImage = referenceDirImages.child(const Uuid().v4());

    try {
      await refImage.putFile(File(image!.path));
      final String url = await refImage.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      print(e);
    }
    return '';
  }
}
