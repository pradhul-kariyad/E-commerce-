// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutProvider extends ChangeNotifier {
  Future<void> logout(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.setBool('userlogin', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SignInPage();
    }));
  }
}
