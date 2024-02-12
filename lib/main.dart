import 'package:flutter/material.dart';
import 'package:mainproject/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(iconTheme: IconThemeData(color: Colors.black)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
