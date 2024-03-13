// ignore_for_file: unused_import
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:mainproject/view/splashScreen/SplashScreen1.dart';
import 'package:mainproject/commonWidget/TextForm.dart';
import 'package:mainproject/commonWidget/checkBox.dart';
import 'package:mainproject/commonWidget/dividerUp.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/home/homePage.dart';

import 'package:sizer/sizer.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phnoController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Fill your information below or register',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            Text(
              'with your social account.',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextForm(
              // obscureText: false,
              name: 'Name',
              controller: nameController,
            ),
            TextForm(
              // obscureText: false,
              name: 'Email',
              controller: mailController,
            ),
            TextForm(
              // obscureText: false,
              name: 'Phone Number',
              controller: phnoController,
            ),
            TextForm(
              // obscureText: true,
              name: 'Password',
              icon: Icons.remove_red_eye_outlined,
              controller: passwordController,
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 2.2.h),
              child: Row(
                children: [
                  Checkboxx(),
                  Text(
                    'Agree with ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 11.1.sp),
                  ),
                  Text(
                    "Terms&Condition",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 11.1.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
              child: GestureDetector(
                  onTap: () {
                    // ignore: avoid_print
                    print('SIGN UP PAGE');
                    signUp(
                        phnoController.text,
                        nameController.text.toString(),
                        mailController.text.toString(),
                        passwordController.text.trim(),
                        context);
                  },
                  child: ContainerButton(name: 'Sign Up')),
            ),
            DividerUp(name: 'Or sign up with'),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 2.4.h,
                  backgroundImage: AssetImage('assets/images/GoogleImg.PNG'),
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/images/fb.PNG'),
                // ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  style:
                      //  Theme.of(context)
                      //     .textTheme
                      //     .displaySmall
                      //     ?.copyWith(color: const Color.fromARGB(66, 158, 120, 120))
                      TextStyle(fontSize: 1.6.h, fontWeight: FontWeight.bold),
                  "Already have an account? ",
                ),
                Text(
                  "Sign in",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontSize: 1.6.h,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signUp(String phoneNumber, String name, String email, password,
    BuildContext context) async {
  try {
    log("Sending sign-up request...");

    var response = await http.post(
      Uri.parse('http://192.168.29.185:3000/flutter/fuser_registration'),
      body: {
        'phoneno': phoneNumber,
        'name': name,
        'email': email,
        'password': password,
      },
    );

    log('Response status code: ${response.statusCode}');
    log('Response body: ${response.body}');

    if (response.statusCode == 200) {
      log("Sign-up successful");
      var result = jsonDecode(response.body);
      String? userid = result['userid'];
      if (userid != null) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('userid', userid);
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OtpVarification();
        }));
      }
      // var result = jsonDecode(response.body);
      // String? token = result['token'];

      // log(token.toString() + "uytrererrrrrrrrrrrr");
    } else {
      log("Sign-up failed with status code: ${response.statusCode}");
      // Show an error message or handle the failure scenario
    }
  } catch (e) {
    log('Error during sign-up: $e');
  }
}
