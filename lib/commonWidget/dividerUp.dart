import 'package:flutter/material.dart';

class DividerUp extends StatelessWidget {
  final name;
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
          indent: 40,
          endIndent: 8,
          thickness: 1,
        )),
        Text(
          name,
          style: TextStyle(
              fontSize: 11, color: Color.fromARGB(255, 173, 171, 171)),
        ),
        Expanded(
            child: Divider(
          indent: 8,
          endIndent: 40,
          thickness: 1,
        ))
      ],
    );
  }
}
