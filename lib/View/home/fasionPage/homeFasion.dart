// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/home/electronicsPage/electronics.dart';
import 'package:mainproject/view/home/electronicsPage/homeElectronicsProduct.dart';
import 'package:mainproject/view/home/fancyPage/homeFancyProduct.dart';
import 'package:mainproject/view/home/fasionPage/homeFasionProduct.dart';
import 'package:sizer/sizer.dart';

class HomeFasion extends StatelessWidget {
  const HomeFasion({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeFasinProduct();
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
            child: CircleAvatar(backgroundImage:AssetImage("assets/images/fasion.PNG") ,
              // backgroundImage: AssetImage(user[index].img),
              backgroundColor: ColorData.grey,
              radius: 25.sp,
              // child: CircleAvatar(
              //   backgroundColor: ColorData.grey,
              //   radius: 16.sp,
              //   // backgroundImage: AssetImage("assets/images/fasion.PNG"),
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
            child: Text(
              "Fasion",
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
