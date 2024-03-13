import 'package:flutter/material.dart';
import 'package:mainproject/commonWidget/TextForm.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:mainproject/view/pages/locationPage.dart';
import 'package:sizer/sizer.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.5.h, left: 3.w),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      print('back button');
                    },
                    icon: Icon(Icons.arrow_back)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Center(
              child: Text(
                'New Password ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Your new password must be different',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          Text(
            "from previously used passwords.",
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextForm(
            name: 'Password',
            icon: (Icons.remove_red_eye_outlined), controller: null,
          ),
          SizedBox(
            height: 1.4.h,
          ),
          TextForm(
            name: 'Confirm Password',
            icon: (Icons.remove_red_eye_outlined), controller: null,
          ),
          SizedBox(
            height: 6.h,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LocationPage();
                }));
                print("Creat New Password");
              },
              child: ContainerButton(name: 'Creat New Password')),
        ],
      )),
    );
  }
}
