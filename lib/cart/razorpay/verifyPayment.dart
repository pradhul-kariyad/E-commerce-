// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/widgets/myButton.dart';
import 'package:mainproject/view/widgets/profileForm/profileButton.dart';
import 'package:sizer/sizer.dart';

class VerifyPayment extends StatelessWidget {
  const VerifyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: CircleAvatar(
                radius: 67.sp,
                backgroundColor: ColorData.red,
                child: Icon(
                  Icons.verified_rounded,
                  color: ColorData.white,
                  size: 100.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Payment Successful!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: ColorData.black),
            ),
            SizedBox(
              height: 0.4.h,
            ),
            Text(
              "Thank you for your purchase.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: ColorData.black),
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              width: 38.w,
              height: 5.h,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorData.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
                  },
                  child: Text(
                    "Continue to shopping",
                    style: TextStyle(
                        color: ColorData.white,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
