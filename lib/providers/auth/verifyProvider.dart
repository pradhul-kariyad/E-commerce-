import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:sizer/sizer.dart';

class VerifyProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> verifyCode(String otp, BuildContext context) async {
    _setLoading(true);

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var userid = pref.getString('userid');

      var response = await http.post(
        Uri.parse('http://${ip}:3000/flutter/validate-otp'),
        body: {
          'otp': otp,
          'id': userid,
        },
      );

      if (response.statusCode == 200) {
        debugPrint('Code verification successful');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "congratulations, your account has been successfully created",
              style: TextStyle(fontSize: 13.sp),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: ColorData.red),
                ),
              ),
            ],
          ),
        );
      } else {
        debugPrint('Code verification failed');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Verification Failed'),
            content: Text('The entered code is incorrect.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: TextStyle(color: ColorData.red)),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      debugPrint('Error occurred: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while verifying the code.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: ColorData.red)),
            ),
          ],
        ),
      );
    } finally {
      _setLoading(false);
    }
  }
}
