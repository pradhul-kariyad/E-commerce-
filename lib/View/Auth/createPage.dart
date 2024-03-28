// ignore_for_file: unused_import, unnecessary_new, must_be_immutable, unused_field, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/widget/myButton.dart';
import 'package:mainproject/view/widget/textForm/nameForm.dart';
import 'package:mainproject/view/widget/pinputVerification/pinputverification.dart';
import 'package:mainproject/view/widget/ipaddress/ipaddress.dart';
import 'package:mainproject/view/auth/otpVerification.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mainproject/view/pages/splashScreen/firstScreen.dart';
import 'package:mainproject/view/widget/textForm/passwordForm.dart';
import 'package:mainproject/view/widget/checkBox.dart';
import 'package:mainproject/view/widget/dividerUp.dart';
import 'package:mainproject/view/auth/otpVerification1.dart';
import 'package:mainproject/view/home/homePage.dart';
import 'package:sizer/sizer.dart';

class CreatePage extends StatefulWidget {
  final void Function()? onTap;
  CreatePage({super.key, this.onTap});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final nameController = TextEditingController();

  final mailController = TextEditingController();

  final phnoController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late String _email;

  bool isSelected = true;

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
                  if (!regExp.hasMatch(value!)) {
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
            
              PasswordForm(
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                obscureText: isSelected ? true : false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                name: 'Password',
                icon: isSelected ? Icons.visibility_off : Icons.visibility,
                controller: passwordController,
                onSaved: (value) {},
              ),
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
                child: MyButton(
                  name: 'Sign Up',
                  onPressed: () {
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
                        Navigator.push(context,
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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return OtpVarification();
        }));
      }
      // var result = jsonDecode(response.body);
      // String? token = result['token'];

      // log(token.toString() + "uytrererrrrrrrrrrrr");
    } else if (response.statusCode == 400) {
      var responseBody = await jsonDecode(response.body);
      if (responseBody['error'] == 'Email ID Already Exist') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.red,
            content: Text("Email ID Already Exist")));
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
