import 'package:mainproject/CommonWidget/verificationForm.dart';
import 'package:mainproject/View/Auth/createPage.dart';
import 'package:mainproject/View/Auth/newPassword.dart';
import 'package:mainproject/View/Auth/otpVerification.dart';
import 'package:mainproject/View/Auth/signInPage.dart';
import 'package:mainproject/View/SplashScreen/SplashScreen1.dart';
import 'package:mainproject/View/Pages/locationOpenPage.dart';
import 'package:mainproject/View/Pages/locationPage.dart';
import 'package:mainproject/View/Pages/notificationPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:mainproject/View/Home/homePage.dart';

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
          home: HomePage(),
        );
      },
    );
  }
}
