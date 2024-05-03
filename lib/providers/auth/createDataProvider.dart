// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateDateProvider extends ChangeNotifier {
  bool isLoading = false;
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> signUp(String phoneNumber, String name, String email, password,
      BuildContext context) async {
    try {
      setLoading(true);
      log("Sending sign-up request...");

      var response = await http.post(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse('http://${ip}:3000/flutter/fuser_registration'),
        body: {
          'phoneno': phoneNumber,
          'name': name,
          'email': email,
          'password': password,
        },
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      setLoading(false);
      if (response.statusCode == 200) {
        log("Sign-up successful");
        var result = jsonDecode(response.body);
        String? userid = result['userid'];
        if (userid != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('userid', userid);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return OtpVarification();
          }));
        }
        // var result = jsonDecode(response.body);
        // String? token = result['token'];
      } else if (response.statusCode == 400) {
        var responseBody = await jsonDecode(response.body);
        if (responseBody['error'] == 'Email ID Already Exist') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorData.red,
              content: Text("Email ID Already Exist")));
        } else {
          // Handle other error cases if needed
        }
        log("Sign-up failed with status code: ${response.statusCode}");
      } else {
        // Handle other status codes if needed
        log("Sign-up failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      log('Error during sign-up: $e');
      setLoading(false);
    }
  }
}
