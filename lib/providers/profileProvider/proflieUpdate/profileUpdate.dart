import 'package:flutter/material.dart';

class ProfileUpdateProvider extends ChangeNotifier {
  String? username;
  ProfileUpdateProvider({this.username});
  void changeUserName({required String newUserName}) async {
    username = newUserName;
    notifyListeners();
  }
}
