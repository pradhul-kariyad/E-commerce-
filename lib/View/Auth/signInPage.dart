// ignore_for_file: unused_import, await_only_futures, use_build_context_synchronously, unused_field
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/auth/newPassword.dart';
import 'package:mainproject/view/widget/textForm/nameForm.dart';
import 'package:mainproject/view/widget/textForm/passwordForm.dart';
import 'package:mainproject/view/widget/dividerUp.dart';
import 'package:mainproject/models/homeData.dart';
import 'package:mainproject/view/auth/createPage.dart';
import 'package:mainproject/view/widget/ipaddress/ipaddress.dart';
import 'package:mainproject/view/auth/otpVerification1.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/home/homePage.dart';
import 'package:mainproject/view/widget/myButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatefulWidget {
  final void Function()? onTap;
  const SignInPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _email;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 2.h),
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
              SizedBox(height: 6.h),
              NameForm(
                name: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value!)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                controller: mailController,
                onSaved: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 1.h),
              PasswordForm(
                onPressed: () {
                  log("visibility icon");
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                obscureText: isSelected ? true : false,
                validator: (value) {
                  return value!.length < 6
                      ? 'Must be at least 6 character'
                      : null;
                },
                name: 'Password',
                controller: passwordController,
                icon: isSelected ? Icons.visibility_off : Icons.visibility,
                onSaved: (value) {},
              ),
              Padding(
                padding: EdgeInsets.only(left: 54.w, top: 1.3.h),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewPasswordPage()),
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
                padding: EdgeInsets.only(top: 9.h),
                child: MyButton(
                  name: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signIn(mailController.text, passwordController.text,
                          context);
                    }
                  },
                ),
              ),
              SizedBox(height: 5.h),
              DividerUp(name: 'Or sign in with'),
              SizedBox(height: 2.h),
              Center(
                child: CircleAvatar(
                  backgroundColor: ColorData.white,
                  radius: 2.4.h,
                  backgroundImage: AssetImage('assets/images/GoogleImg.PNG'),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreatePage()),
                      );
                    },
                    child: Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          fontSize: 1.6.h, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
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
      ),
    );
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      log("Sending login request...");

      var response = await http.post(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse('http://${ip}:3000/flutter/fuser_signin'),
        body: {'email': email, 'password': password},
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: Text('Sign-in successful...'),
        //     actions: [
        //       TextButton(
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         },
        //         child: Text('OK'),
        //       ),
        //     ],
        //   ),
        // );
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
          // ignore: avoid_print, unnecessary_brace_in_string_interps
          print('local store: ${pref}');
          // homeData();
          Navigator.pushReplacement(
            // Use pushReplacement to replace the current route with the home page
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()), // Navigate to the HomePage
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
    }
  }
}
