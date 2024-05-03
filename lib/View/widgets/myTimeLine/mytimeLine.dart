// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/widgets/myTimeLine/eventCart.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCart;

  const MyTimeLine(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      this.eventCart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        //decorate the line
        beforeLineStyle: LineStyle(
            color: isPast ? ColorData.red : Color.fromARGB(255, 224, 219, 219)),
        //decorate the icon
        indicatorStyle: IndicatorStyle(
            width: 22.sp,
            color: isPast ? ColorData.red : Color.fromARGB(255, 224, 219, 219),
            iconStyle: IconStyle(iconData: Icons.done, color: ColorData.white)),
        endChild: EventCart(
          isPast: isPast,
          child: eventCart,
        ),
      ),
    );
  }
}
