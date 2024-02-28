import 'package:flutter/material.dart';
import 'package:postapp/product/models/auth_user_model.dart';

/// This is a class for provide the auth user to all the widgets
/// So we can get the auth user's data in any widget we want
class AuthUserProvider extends ChangeNotifier {
  /// if user didn't log-in the value will be null
  AuthUserModel? authUser;

  AuthUserProvider({required this.authUser});

  void changeUser(AuthUserModel? model) {
    authUser = model;
    notifyListeners();
  }
}
