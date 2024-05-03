// ignore_for_file: unused_import, await_only_futures, use_build_context_synchronously, unused_field, unnecessary_brace_in_string_interps, avoid_print, must_be_immutable
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/iconProvider/iconProvider.dart';
import 'package:mainproject/providers/auth/signInProvider.dart';
import 'package:mainproject/view/auth/newPassword.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/widgets/textForm/nameForm.dart';
import 'package:mainproject/view/widgets/textForm/passwordForm.dart';
import 'package:mainproject/view/widgets/dividerUp.dart';
import 'package:mainproject/models/examples/examples.dart';
import 'package:mainproject/view/auth/createPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/view/auth/otpVerification1.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/widgets/myButton.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatelessWidget {
  final void Function()? onTap;
  SignInPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _email;
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
                  if (!regExp.hasMatch(value)) {
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
              Consumer<IconProvider>(
                builder: (BuildContext context, iconAndOb, Widget? child) {
                  return PasswordForm(
                    onPressed: () {
                      log("visibility icon");
                      iconAndOb.changeIcon();
                      iconAndOb.changeObt();
                    },
                    obscureText: iconAndOb.changeOb,
                    validator: (value) {
                      return value!.length < 6
                          ? 'Must be at least 6 character'
                          : null;
                    },
                    name: 'Password',
                    controller: passwordController,
                    icon: iconAndOb.icon,
                    onSaved: (value) {},
                  );
                },
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
                child: Consumer<SignInProvider>(
                  builder:
                      (BuildContext context, signInProvider, Widget? child) {
                    if (signInProvider.isLoading) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: ColorData.grey,
                        strokeAlign: -4,
                      ));
                    }
                    return MyButton(
                      name: 'Sign In',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signInProvider.signIn(mailController.text,
                              passwordController.text, context);
                        }
                      },
                    );
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
}
