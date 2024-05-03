import 'package:flutter/material.dart';
import 'package:mainproject/providers/iconProvider/iconProvider.dart';
import 'package:provider/provider.dart';

class Checkboxx extends StatefulWidget {
  const Checkboxx({super.key});

  @override
  State<Checkboxx> createState() => _CheckboxxState();
}

class _CheckboxxState extends State<Checkboxx> {
  // bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  // bool fourthValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<IconProvider>(
          builder: (BuildContext context, add, Widget? child) {
            return Checkbox(
                activeColor: Colors.red,
                value: add.firstValue,
                onChanged: (value) {
                  add.changeCheckBox();
                });
          },
        ),
        //  Checkbox(
        // value: secondValue,
        // onChanged: (value) {
        //   setState(() {
        //     secondValue = value!;
        //   });
        // }),
        //  Checkbox(
        // value: thirdValue,
        // onChanged: (value) {
        //   setState(() {
        //     thirdValue = value!;
        //   });
        // }),
      ],
    );
  }
}
