// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EventCart extends StatelessWidget {
  final bool isPast;
  final child;

  const EventCart({super.key, required this.isPast, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.sp),
      // padding: EdgeInsets.all(16.sp),
      child: child,
    );
  }
}
