import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.5.h, left: 3.w),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('back button');
                        },
                        icon: Icon(Icons.arrow_back)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 5.5.h),
                child: Text(
                  "Product Details",
                  style: TextStyle(
                      color: ColorData.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 5.5.h),
                child: CircleAvatar(
                  foregroundColor: ColorData.black,
                  backgroundColor: ColorData.wgrey,
                  child: IconButton(
                      onPressed: () {
                        // ignore: avoid_print
                        print("favorite button");
                      },
                      icon: Icon(Icons.favorite_border_rounded)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
