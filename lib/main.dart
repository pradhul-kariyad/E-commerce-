import 'package:flutter/material.dart';
import 'package:mainproject/pages/createPage.dart';
import 'package:mainproject/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//       theme: ThemeData(
//           // scaffoldBackgroundColor: Colors.black,
// //        appBarTheme: ,
//           textTheme:
//               TextTheme(bodyLarge: TextStyle(), displaySmall: TextStyle()),
//           iconTheme: IconThemeData(color: Colors.black)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
