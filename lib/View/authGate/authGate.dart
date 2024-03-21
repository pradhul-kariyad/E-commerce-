// import 'package:flutter/material.dart';
// import 'package:mainproject/view/home/homePage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends State<MyWidget> {
//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }

//   Future<void> checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');

//     if (token != null) {
//       // Navigate to home page if token exists
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Your widget's UI code goes here
//     return Scaffold(body:checkLoginStatus() ,
//       // Scaffold or any other widget
//     );
//   }
// }
