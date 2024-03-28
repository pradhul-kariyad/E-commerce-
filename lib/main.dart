// ignore_for_file: unused_import, must_be_immutable
import 'package:mainproject/service/providerService.dart';
import 'package:mainproject/view/widget/pinputVerification/pinputverification.dart';
import 'package:mainproject/view/widget/verificationForm.dart';
import 'package:mainproject/view/auth/createPage.dart';
import 'package:mainproject/view/auth/newPassword.dart';
import 'package:mainproject/view/auth/otpVerification1.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/home/productPage.dart';
import 'package:mainproject/view/pages/splashScreen/firstScreen.dart';
import 'package:mainproject/view/pages/locationPage/locationOpenPage.dart';
import 'package:mainproject/view/pages/locationPage/locationPage.dart';
import 'package:mainproject/view/pages/notificationPage/notificationPage.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userlogin = prefs.getBool('userlogin') ?? false;
  runApp(MyApp(
    userlogin: userlogin,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.userlogin});
  bool userlogin;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            //appBarTheme: ,
            //textTheme:  ,
            //TextTheme(bodyLarge: TextStyle(), displaySmall: TextStyle()),
            //iconTheme: IconThemeData(color: Colors.black)),
            debugShowCheckedModeBanner: false,
            home: 
            // ProviderService()
            userlogin ? HomePage() : FirstSreen(),
            );
      },
    );
  }
}
