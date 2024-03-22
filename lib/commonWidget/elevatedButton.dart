// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class MyElevated extends StatelessWidget {
  const MyElevated({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86.w,
      height: 6.5.h,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ColorData.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)))),
          onPressed: () {
            print('object');
          },
          child: Text("Sign In")),
    );
  }
}
