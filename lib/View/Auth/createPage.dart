// ignore_for_file: unused_import, unnecessary_new, must_be_immutable, unused_field, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/auth/createDataProvider.dart';
import 'package:mainproject/providers/iconProvider/iconProvider.dart';
import 'package:mainproject/view/widgets/myButton.dart';
import 'package:mainproject/view/widgets/textForm/nameForm.dart';
import 'package:mainproject/view/widgets/pinputVerification/pinputverification.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mainproject/view/pages/splashScreen/firstScreen.dart';
import 'package:mainproject/view/widgets/textForm/passwordForm.dart';
import 'package:mainproject/view/widgets/checkBox.dart';
import 'package:mainproject/view/widgets/dividerUp.dart';
import 'package:mainproject/view/auth/otpVerification1.dart';
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

              NameForm(
                  name: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: nameController,
                  onSaved: (value) {}),

              NameForm(
                name: "Email",
                controller: mailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regExp = new RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),

              NameForm(
                  name: "Phone Number",
                  controller: phnoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {}),

              Consumer<IconProvider>(
                builder: (BuildContext context, icon, Widget? child) {
                  return PasswordForm(
                    onPressed: () {
                      icon.changeIcon();
                      icon.changeObt();
                    },
                    obscureText: icon.changeOb,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    name: 'Password',
                    icon: icon.icon,
                    controller: passwordController,
                    onSaved: (value) {},
                  );
                },
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 1.h, left: 2.2.h),
              //   child: Row(
              //     children: [
              //       Checkboxx(),
              //       Text(
              //         'Agree with ',
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500, fontSize: 11.1.sp),
              //       ),
              //       Text(
              //         "Terms&Condition",
              //         style: TextStyle(
              //             color: Colors.red,
              //             fontSize: 11.1.sp,
              //             decoration: TextDecoration.underline,
              //             fontWeight: FontWeight.w500),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
                child: Consumer<CreateDateProvider>(
                  builder: (BuildContext context, create, Widget? child) {
                    if (create.isLoading) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: ColorData.grey,
                        strokeAlign: -4,
                      ));
                    }
                    return MyButton(
                      name: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          create.signUp(
                              phnoController.text,
                              nameController.text.toString(),
                              mailController.text.toString(),
                              passwordController.text.trim(),
                              context);
                        }

                        // ignore: avoid_print
                        print('SIGN UP PAGE');
                      },
                    );
                  },
                ),
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
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
                      child: Text(
                        style:
                            //  Theme.of(context)
                            //     .textTheme
                            //     .displaySmall
                            //     ?.copyWith(color: const Color.fromARGB(66, 158, 120, 120))
                            TextStyle(
                                fontSize: 1.6.h, fontWeight: FontWeight.bold),
                        "Already have an account? ",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.red,
                            fontSize: 1.6.h,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
