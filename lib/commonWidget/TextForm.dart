import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class TextForm extends StatelessWidget {
   
  final String name;
  final IconData? icon;
  final TextEditingController? controller;
  const TextForm({
    this.icon,
    required this.name,
    super.key,
    required this.controller,
    // required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 1.h,
            top: 3.h,
            left: 1.w,
          ),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 10.sp,
                // fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorData.black),
          ),
        ),
        Container(
            height: 6.h,
            width: 86.w,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 236, 236),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: TextFormField(
                // obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('password Icon');
                        },
                        icon: Icon(icon)),
                    // Icon(
                    //   icon,
                    //   // color: Colors.black,
                    //   size: 22,
                    // ),
                    border: InputBorder.none),
              ),
            )),
      ],
    );
  }
}
