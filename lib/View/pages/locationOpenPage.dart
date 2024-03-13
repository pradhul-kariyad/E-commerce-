import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class LocationOPenPage extends StatelessWidget {
  const LocationOPenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: IconButton(
                      onPressed: () {
                        print('back button');
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    "Enter Your Location",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
              width: 93.w,
              height: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorData.grey),
              child: TextFormField(
                decoration: InputDecoration(
                    // hintText: "your location",
                    // hintStyle: TextStyle(color: Colors.grey,fontSize: 12.sp),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.backspace_outlined,
                          size: 15.sp,
                          color: ColorData.red,
                        )),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.manage_search_sharp)),
                    border: InputBorder.none),
              )),
        ],
      )),
    );
  }
}
