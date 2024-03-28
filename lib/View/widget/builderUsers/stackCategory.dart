import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/widget/builderUsers/listviewUsers.dart';
import 'package:sizer/sizer.dart';

class StackCategory extends StatelessWidget {
  const StackCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.7.h, bottom: 1.7.h),
      child: SizedBox(
        // color: Colors.cyan,
        width: 100.w,
        height: 15.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: user.length,
            itemBuilder: ((context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
                    child: CircleAvatar(
                      // backgroundImage: AssetImage(user[index].img),
                      backgroundColor: ColorData.grey,
                      radius: 25.sp,
                      child: CircleAvatar(
                        backgroundColor: ColorData.grey,
                        radius: 16.sp,
                        backgroundImage: AssetImage(user[index].img),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
                    child: Text(
                      user[index].category,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: ColorData.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}
