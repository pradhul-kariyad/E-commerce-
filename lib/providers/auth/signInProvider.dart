// ignore_for_file: use_build_context_synchronously, unnecessary_brace_in_string_interps, unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  bool isLoading = false; // Change isloading to isLoading

  // Method to toggle isLoading
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners(); // Notify listeners when isLoading changes
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      setLoading(true); // Set loading to true when signIn process starts

      log("Sending login request...");

      var response = await http.post(
        Uri.parse('http://${ip}:3000/flutter/fuser_signin'),
        body: {'email': email, 'password': password},
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      setLoading(false); // Set loading to false after receiving response

      if (response.statusCode == 200) {
        // showDialog(...);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.red,
            content: Text("Sign-in successful...")));

        log("Sign-in successful");
        var result = jsonDecode(response.body);
        String? token = result['token'];

        if (token != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('token', token);
          await pref.setBool('userlogin', true);
          log('local store: ${pref}');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        }
      } else if (response.statusCode == 400) {
        var responseBody = await jsonDecode(response.body);
        if (responseBody['error'] == 'Invalid email') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorData.red, content: Text("Invalid email")));
        } else if (responseBody['error'] == 'Invalid password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorData.red,
              content: Text("Invalid Password")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorData.red, content: Text("Invalid Email")));
        }
        log("Sign-in failed with status code: ${response.statusCode}");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.red,
            content: Text("Sign-in failed...")));
        log("Sign-in failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      log('Error during sign-in: $e');
      setLoading(false); // Set loading to false if an error occurs
    }
  }
}
