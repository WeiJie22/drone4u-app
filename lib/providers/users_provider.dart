import 'package:drone4u/models/user.dart';
import 'package:drone4u/services/upload_service.dart';
import 'package:drone4u/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SettingProvider extends ChangeNotifier {
  bool isLoading = false;
  bool initCat = false;
  User currentUser = FirebaseAuth.instance.currentUser!;

  SingleUser? user;
  List<String> categories = [];

  SettingProvider({bool initCat = false}) {
    initCat ? initCategories() : initData();
  }

  initData() async {
    isLoading = true;
    user = await UserService.getSingleUser(currentUser.uid);
    isLoading = false;
    notifyListeners();
  }

  initCategories() async {
    isLoading = true;
    categories = await UploadService.getCategories();
    isLoading = false;
    notifyListeners();
  }
}
