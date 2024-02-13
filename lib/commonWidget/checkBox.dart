import 'package:flutter/material.dart';

class Checkboxx extends StatefulWidget {
  const Checkboxx({super.key});

  @override
  State<Checkboxx> createState() => _CheckboxxState();
}

class _CheckboxxState extends State<Checkboxx> {
  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  // bool fourthValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
            activeColor: Colors.red,
            value: firstValue,
            onChanged: (value) {
              setState(() {
                firstValue = value!;
              });
            }),
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
