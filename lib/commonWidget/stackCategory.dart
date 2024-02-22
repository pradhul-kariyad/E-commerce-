import 'package:flutter/material.dart';
import 'package:mainproject/Colors/colors.dart';
import 'package:mainproject/ListViewUser/listviewUsers.dart';
import 'package:sizer/sizer.dart';

class StackCategory extends StatelessWidget {
  const StackCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.cyan,
      width: 100.w,
      height: 17.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: user.length,
          itemBuilder: ((context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
                    child: CircleAvatar(
                        backgroundColor: ColorData.greyColor, radius: 25.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w,top: 1.h, right: 4.w),
                    child: Text(
                      user[index].category,
                      style: TextStyle(
                          color: ColorData.blackColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
