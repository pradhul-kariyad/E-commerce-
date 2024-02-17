import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mainproject/CommonWidget/TextForm.dart';
import 'package:mainproject/CommonWidget/containerButton.dart';
import 'package:mainproject/CommonWidget/dividerUp.dart';
import 'package:mainproject/View/Auth/createPage.dart';
import 'package:mainproject/View/Auth/newPassword.dart';
import 'package:mainproject/View/Auth/otpVerification.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                  fontWeight: FontWeight.w500),
            )),
          ),
          Text(
            "Hi!Welcome back, you've been missed",
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextForm(name: 'Email'),
          SizedBox(
            height: 1.h,
          ),
          TextForm(
            name: 'Password',
            icon: Icons.remove_red_eye_outlined,
          ),
          Padding(
            padding: EdgeInsets.only(left: 54.w, top: 1.3.h),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OtpVarification();
                }));
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: ContainerButton(name: 'Sign In'),
          ),
          SizedBox(
            height: 5.h,
          ),
          DividerUp(name: 'Or sign in with'),
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: CircleAvatar(
              radius: 2.4.h,
              backgroundImage: AssetImage('assets/images/GoogleImg.PNG'),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dont't have an account? ",
                style: TextStyle(fontSize: 1.6.h, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CreatePage();
                  }));
                },
                child: Text(
                  "Sign Up ",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontSize: 1.6.h,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
