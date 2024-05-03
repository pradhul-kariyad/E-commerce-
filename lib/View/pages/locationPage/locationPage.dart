// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/widgets/myButton.dart';
import 'package:sizer/sizer.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Center(
              child: CircleAvatar(
                  // ignore: sort_child_properties_last
                  child: Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                    size: 5.h,
                  ),
                  radius: 47,
                  backgroundColor: Color.fromARGB(255, 244, 242, 242))),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Center(
              child: Text(
                'What is Your Location?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'We need to know your location in order to suggest',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          Text(
            'nearby services.',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 3.2.h),
            child: MyButton(
              name: "Allow Location Access",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
                // ignore: avoid_print
                print("location access");
              },
            ),
          ),
          Text(
            "Enter Location Manually",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
