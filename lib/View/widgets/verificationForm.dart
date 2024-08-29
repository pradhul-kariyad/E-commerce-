// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 236, 236),
          borderRadius: BorderRadius.circular(8)),
      height: 6.h,
      width: 10.w,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (pin1) {},
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: '_',
            hintStyle: TextStyle(color: Color.fromARGB(255, 182, 181, 181)),
            border: InputBorder.none),
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
