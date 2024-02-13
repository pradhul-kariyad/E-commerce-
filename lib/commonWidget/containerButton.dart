import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final name;
  const ContainerButton({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      width: 320,
      height: 46,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(14)),
    );
  }
}
