import 'package:drone4u/models/user.dart';
import 'package:drone4u/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  User currentUser = FirebaseAuth.instance.currentUser!;

  SingleUser? user;

  UserProvider() {
    initData();
  }

  initData() async {
    user = await UserService.getSingleUser(currentUser.uid);
    notifyListeners();
  }
}
