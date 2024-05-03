// ignore_for_file: unused_import, file_names
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/home/electronicsPage/electronics.dart';
import 'package:mainproject/view/home/electronicsPage/homeElectronicsProduct.dart';
import 'package:sizer/sizer.dart';

class HomeElectronics extends StatelessWidget {
  const HomeElectronics({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeElectronicsProduct();
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/electronics.PNG"),
              backgroundColor: ColorData.grey,
              radius: 25.sp,
              // child: CircleAvatar(
              //   backgroundColor: ColorData.grey,
              //   radius: 16.sp,
              //   backgroundImage: AssetImage("assets/images/headSet.PNG"),
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
            child: Text(
              "Electronics",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: ColorData.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
