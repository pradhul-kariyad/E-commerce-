import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String name;
  final IconData? icon;
  const TextForm({this.icon, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 6,
            top: 20,
            left: 3,
          ),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        Container(
          height: 47,
            width: 315,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 236, 236),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          print('password Icon');
                        },
                        icon: Icon(icon)),
                    // Icon(
                    //   icon,
                    //   // color: Colors.black,
                    //   size: 22,
                    // ),
                    border: InputBorder.none),
              ),
            )),
      ],
    );
  }
}
