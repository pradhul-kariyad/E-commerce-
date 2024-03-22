// ignore_for_file: unused_import, unnecessary_new, must_be_immutable, unused_field
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/commonWidget/pinputVerification/pinputverification.dart';
import 'package:mainproject/commonWidget/ipaddress.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:mainproject/view/splashScreen/SplashScreen1.dart';
import 'package:mainproject/commonWidget/TextForm.dart';
import 'package:mainproject/commonWidget/checkBox.dart';
import 'package:mainproject/commonWidget/dividerUp.dart';
import 'package:mainproject/view/auth/otpVerification1.dart';
import 'package:mainproject/view/home/homePage.dart';
import 'package:sizer/sizer.dart';

class CreatePage extends StatelessWidget {
  final void Function()? onTap;
  CreatePage({super.key, this.onTap});
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phnoController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorData.white,
        toolbarHeight: 14.5.h,
        title: Column(
          children: [
            Text(
              'Create Account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 1.h,
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: 6.h),
              //   child: Center(
              //     child: Text(
              //       'Create Account',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 25.sp,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),

              // Text(
              //   'Fill your information below or register',
              //   style: TextStyle(
              //       fontSize: 11.sp,
              //       fontWeight: FontWeight.w400,
              //       color: const Color.fromARGB(255, 209, 207, 207)),
              // ),
              // Text(
              //   'with your social account.',
              //   style: TextStyle(
              //       fontSize: 11.sp,
              //       fontWeight: FontWeight.w400,
              //       color: const Color.fromARGB(255, 209, 207, 207)),
              // ),

              TextForm(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                // obscureText: false,
                // labelText: 'Name',
                name: 'Name',
                controller: nameController, onSaved: (value) {},
              ),
              TextForm(
                // labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regExp = new RegExp(pattern);
                  if (!regExp.hasMatch(value!)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },

                // (value) {
                //   return !value!.contains('@gmail.com')
                //       ? 'Please enter a valid email'
                //       : null;
                // },
                name: 'Email',
                controller: mailController,
              ),
              TextForm(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                // obscureText: false,
                name: 'Phone Number',
                controller: phnoController, onSaved: (value) {},
                // labelText: 'Phone Number',
              ),
              TextForm(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                // obscureText: true,
                name: 'Password',
                // labelText: 'Password',
                icon: Icons.remove_red_eye_outlined,
                controller: passwordController, onSaved: (value) {},
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
                      _formKey.currentState!.validate();
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignInPage();
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style:
                            //  Theme.of(context)
                            //     .textTheme
                            //     .displaySmall
                            //     ?.copyWith(color: const Color.fromARGB(66, 158, 120, 120))
                            TextStyle(
                                fontSize: 1.6.h, fontWeight: FontWeight.bold),
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
                ),
              ),
            ],
          ),
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

    if (response.statusCode == 200) {
      log("Sign-up successful");
      var result = jsonDecode(response.body);
      String? userid = result['userid'];
      if (userid != null) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('userid', userid);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return OtpVarification();
        }));
      }
      // var result = jsonDecode(response.body);
      // String? token = result['token'];

      // log(token.toString() + "uytrererrrrrrrrrrrr");
    } else if (response.statusCode == 400) {
      var responseBody = jsonDecode(response.body);
      if (responseBody['error'] == 'Email ID Already Exist') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.red,
            content: Text("Email ID Already Exists")));
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
  }
}
