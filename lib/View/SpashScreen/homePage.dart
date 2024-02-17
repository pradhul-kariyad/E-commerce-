import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mainproject/CommonWidget/containerButton.dart';
import 'package:mainproject/View/Auth/createPage.dart';
import 'package:mainproject/View/Auth/signInPage.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, left: 3.w),
                    child: Container(
                      child: Column(
                        children: [
                          firstRow('assets/images/cameraa2.PNG'),
                          firstRow('assets/images/iphone123.PNG'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.h, left: 3.w, bottom: 2.h),
                    child: Container(
                      child: Column(
                        children: [
                          secondRow('assets/images/hoodie.PNG', 145, 226),
                          secondRow('assets/images/iwatch.PNG', 90, 120),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 1.w, bottom: 1.h),
                    child: Container(
                      child: Column(
                        children: [
                          thirdRow('assets/images/water bottle.PNG'),
                          thirdRow('assets/images/headSet.PNG'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Shopping ",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                Text(
                  "Destination",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
              ],
            ),
            Text('for Everything',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp)),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: GestureDetector(
                onTap: () {
                  print('Start Page');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CreatePage();
                  }));
                },
                child: ContainerButton(
                  name: "Let's Get Started",
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Let's Get Started"),
            //   style: ElevatedButton.styleFrom(

            //     backgroundColor: (Colors.red)),
            // ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?  ',
                  style:
                      //  Theme.of(context)
                      //     .textTheme
                      //     .displaySmall
                      //     ?.copyWith(color: const Color.fromARGB(66, 158, 120, 120))
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignInPage();
                    }));
                    print("Sign In");
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.red,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding thirdRow(String img) {
    return Padding(
      padding: EdgeInsets.only(top: 6.3.h),
      child: Container(
        width: 26.w,
        height: 18.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Padding secondRow(String img, double width, double height) {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: Container(
        width: width, //130,
        height: height, //170,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Padding firstRow(String img) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Container(
        width: 25.w,
        height: 18.h,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img)),
            // color: Color.fromARGB(255, 195, 210, 218).withOpacity(.4),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
