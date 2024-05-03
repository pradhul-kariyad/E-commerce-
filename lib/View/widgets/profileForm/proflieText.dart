import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:sizer/sizer.dart';

class ProfileText extends StatelessWidget {
  final String name;
  final IconData icon;
  final IconData iconData;
  final VoidCallback onTap;
  final VoidCallback iconTap;
  const ProfileText(
      {super.key,
      required this.name,
      required this.icon,
      required this.iconData,
      required this.onTap,
      required this.iconTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: ColorData.red),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  name,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            IconButton(
                onPressed: iconTap,
                icon: Icon(
                  iconData,
                  color: ColorData.red,
                )),
          ],
        ),
      ),
    );
  }
}
