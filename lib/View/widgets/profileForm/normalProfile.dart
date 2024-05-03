import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class NormalProfile extends StatelessWidget {
  final String name;
  final String profileName;
  const NormalProfile(
      {super.key, required this.name, required this.profileName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 1.h,
            top: 1.h,
            left: 1.w,
          ),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 10.sp,
                // fontSize: 12,
                fontWeight: FontWeight.bold,
                color: ColorData.black),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5.w, top: 2.3.h),
          width: 90.w,
          height: 7.h,
          decoration: BoxDecoration(
              color: ColorData.wgrey,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Text(
            profileName,
            style: TextStyle(
                color: ColorData.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
