import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key,
  //  required this.image
   });
  //  final String  image ;
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
            color: ColorData.red,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/images/(1).PNG"),
                fit: BoxFit.cover),
          ),
          width: 95.w,
          height: 24.h,
        ),
      ),
    );
  }
}
