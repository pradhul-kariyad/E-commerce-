import 'package:flutter/material.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:sizer/sizer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
                    Icons.add_alert_sharp,
                    color: Colors.red,
                    size: 5.h,
                  ),
                  radius: 47,
                  backgroundColor: Color.fromARGB(255, 244, 242, 242))),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Center(
              child: Text(
                'Enable Notification Access',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Enable notifications to receive real-time',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          Text(
            'updates on your Order.',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 3.2.h),
            child: GestureDetector(
                onTap: () {
                  // ignore: avoid_print
                  print("notification access");
                },
                child: ContainerButton(name: "Allow Notification")),
          ),
          Text(
            "Maybe Later",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
