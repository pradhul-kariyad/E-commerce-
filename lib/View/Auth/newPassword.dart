// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/commonWidget/TextForm.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:mainproject/commonWidget/customTextField.dart';
import 'package:mainproject/view/pages/locationPage.dart';
import 'package:sizer/sizer.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.5.h, left: 3.w),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        print('back button');
                      },
                      icon: Icon(Icons.arrow_back)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Center(
                child: Text(
                  'New Password ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Your new password must be different',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            Text(
              "from previously used passwords.",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              child: TextForm(
                validator: (value) {
                  return value!.length < 6
                      ? 'Must be at least 6 character'
                      : null;
                },

                //  (value) {
                //   return !value!.contains('@gmail.com')
                //       ? 'Please enter a valid email'
                //       : null;
                // },
                // (value) {

                // if (value == null || value.isEmpty) {
                //   return 'Please enter Password';
                // }
                // return null;
                // },
                name: 'Password',
                icon: (Icons.remove_red_eye_outlined),
                controller: null,
              ),
            ),
            SizedBox(
              height: 1.4.h,
            ),
            TextForm(
              validator: (value) {
                return value!.length < 6
                    ? 'Must be at least 6 character'
                    : null;
              },
              name: 'Confirm Password',
              icon: (Icons.remove_red_eye_outlined),
              controller: null,
            ),
            SizedBox(
              height: 6.h,
            ),
            GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: ColorData.red,
                          content: Text("Processing Data....")));
                  }
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return LocationPage();
                  // }));
                  print("Creat New Password");
                },
                child: ContainerButton(name: 'Create New Password')),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      )),
    );
  }
}
