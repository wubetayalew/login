import 'package:flutter/material.dart';
import 'package:user_geze/models/user_model.dart';
import 'package:user_geze/repositry/firebase/firebase_auth_method.dart';
import 'package:user_geze/repositry/firebase/firebase_user_repo.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await FirebaseAuthMethod().getUserDetail();
    _user = user;
    notifyListeners();
  }
}
