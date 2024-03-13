// ignore_for_file: unused_import
import 'package:mainproject/commonWidget/verificationForm.dart';
import 'package:mainproject/view/auth/OtpVarification2.dart';
import 'package:mainproject/view/auth/createPage.dart';
import 'package:mainproject/view/auth/newPassword.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/home/productPage.dart';
import 'package:mainproject/view/splashScreen/SplashScreen1.dart';
import 'package:mainproject/view/pages/locationOpenPage.dart';
import 'package:mainproject/view/pages/locationPage.dart';
import 'package:mainproject/view/pages/notificationPage.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          //       theme: ThemeData(
          //           // scaffoldBackgroundColor: Colors.black,
          // //        appBarTheme: ,
          //           textTheme:
          //               TextTheme(bodyLarge: TextStyle(), displaySmall: TextStyle()),
          //           iconTheme: IconThemeData(color: Colors.black)),
          debugShowCheckedModeBanner: false,
          home: PinPut(),
        );
      },
    );
  }
}
