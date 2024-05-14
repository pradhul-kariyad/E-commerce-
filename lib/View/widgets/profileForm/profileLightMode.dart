import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/profileProvider/themeProvider/themeProvider.dart';
import 'package:mainproject/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfileLightMode extends StatelessWidget {
  final String name;
  final IconData icon;
  final IconData iconData;
  final VoidCallback onTap;
  final VoidCallback iconTap;
  const ProfileLightMode(
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
            Consumer<ThemeProvider>(
              builder: (BuildContext context, theme, Widget? child) {
                return Switch(
                  value: theme.getTheme() == darkMode,
                  // Provider.of<ThemeProvider>(context).getTheme() == lightMode,
                  onChanged: (value) {
                    toggleTheme(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
