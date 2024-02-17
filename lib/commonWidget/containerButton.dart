import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContainerButton extends StatelessWidget {
  final name;
  const ContainerButton({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      width: 86.w,
      height: 6.5.h,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(14)),
    );
  }
}
