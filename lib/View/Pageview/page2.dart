import 'package:flutter/material.dart';
import 'package:mainproject/Colors/colors.dart';
import 'package:sizer/sizer.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 2.w),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3, 2), // changes position of shadow
                ),
              ],
              color: ColorData.redColor,
              borderRadius: BorderRadius.circular(20)),
          width: 95.w,
          height: 24.h,
        ),
      ),
    );
    ;
  }
}