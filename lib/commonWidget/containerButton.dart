import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class ContainerButton extends StatelessWidget {
  final String name;

  const ContainerButton({
    // required this.bool,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 12.sp,
              color: ColorData.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      width: 86.w,
      height: 6.5.h,
      decoration: BoxDecoration(
          color: ColorData.red, borderRadius: BorderRadius.circular(14)),
    );
  }
}
