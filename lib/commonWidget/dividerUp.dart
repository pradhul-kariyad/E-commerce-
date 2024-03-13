// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DividerUp extends StatelessWidget {
  final String name;
  const DividerUp({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          indent: 6.h,
          endIndent: 1.3.h,
          thickness: 1,
        )),
        Text(
          name,
          style: TextStyle(
              fontSize: 11, color: Color.fromARGB(255, 173, 171, 171)),
        ),
        Expanded(
            child: Divider(
          indent: 1.3.h,
          endIndent: 6.h,
          thickness: 1,
        ))
      ],
    );
  }
}
