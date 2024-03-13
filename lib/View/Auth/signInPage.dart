import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/commonWidget/TextForm.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:mainproject/commonWidget/dividerUp.dart';
import 'package:mainproject/view/auth/createPage.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/home/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 2.h),
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Text(
              "Hi! Welcome back, you've been missed",
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207),
              ),
            ),
            SizedBox(height: 7.h),
            TextForm(name: 'Email', controller: mailController),
            
            SizedBox(height: 1.h),
            TextForm(
              name: 'Password',
              controller: passwordController,
              icon: Icons.remove_red_eye_rounded,
            ),
            Padding(
              padding: EdgeInsets.only(left: 54.w, top: 1.3.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVarification()),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: GestureDetector(
                onTap: () {
                  signIn(
                      mailController.text, passwordController.text, context);
                },
                child: ContainerButton(name: 'Sign In'),
              ),
            ),
            SizedBox(height: 5.h),
            DividerUp(name: 'Or sign in with'),
            SizedBox(height: 3.h),
            Center(
              child: CircleAvatar(
                radius: 2.4.h,
                backgroundImage: AssetImage('assets/images/GoogleImg.PNG'),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style:
                      TextStyle(fontSize: 1.6.h, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePage()),
                    );
                  },
                  child: Text(
                    "Sign Up ",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontSize: 1.6.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      log("Sending login request...");

      var response = await http.post(
        Uri.parse('http://192.168.29.185:3000/flutter/fuser_signin'),
        body: {'email': email, 'password': password},
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        log("Sign-in successful");
        var result = jsonDecode(response.body);
        String? token = result['token'];

        if (token != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('token', token);
          // ignore: avoid_print, unnecessary_brace_in_string_interps
          print('local store: ${pref}');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            // Use pushReplacement to replace the current route with the home page
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()), // Navigate to the HomePage
          );
        }
      } else {
        log("Sign-in failed with status code: ${response.statusCode}");
        // Show an error message or handle the failure scenario
      }
    } catch (e) {
      log('Error during sign-in: $e');
    }
  }
}
