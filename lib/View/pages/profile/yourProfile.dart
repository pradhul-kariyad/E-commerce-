// ignore_for_file: avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/profileProvider/profileProvider.dart';
import 'package:mainproject/view/pages/profile/profilePage.dart';
import 'package:mainproject/view/pages/profile/profileUpdate.dart';
import 'package:mainproject/view/widgets/profileForm/normalProfile.dart';
import 'package:mainproject/view/widgets/profileForm/profileButton.dart';
import 'package:mainproject/view/widgets/profileForm/profileForm.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class YourProfile extends StatelessWidget {
  const YourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.red,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage();
              }));
            },
            icon: Icon(Icons.arrow_back, color: ColorData.white)),
        title: Center(
          widthFactor: 1.6.sp,
          child: Text(
            "Your Profile",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: ColorData.white),
          ),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: 4.h, left: 2.w),
          //   child: Row(
          //     children: [
          //       IconButton(
          //           onPressed: () {
          //             Navigator.push(context,
          //                 MaterialPageRoute(builder: (context) {
          //               return ProfilePage();
          //             }));
          //             print('back button');
          //           },
          //           icon: Icon(Icons.arrow_back)),
          //       SizedBox(
          //         width: 21.w,
          //       ),
          //       Text(
          //         "Your profile",
          //         style:
          //             TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 5.h,
          ),
          Center(
              child: Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/hoodie.PNG"),
                radius: 50.sp,
              ),
              // Positioned(
              //     top: 11.h,
              //     left: 24.w,
              //     child: CircleAvatar(
              //       radius: 14.sp,
              //       backgroundColor: ColorData.red,
              //       child: IconButton(
              //           onPressed: () {},
              //           icon: Icon(
              //             Icons.edit,
              //             size: 15.sp,
              //             color: ColorData.white,
              //           )),
              //     )),
            ],
          )),
          SizedBox(
            height: 3.h,
          ),
          Consumer<ProfileProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return NormalProfile(
                  name: "Name", profileName: value.data.data!.name.toString());
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          Consumer<ProfileProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return NormalProfile(
                  name: "Email",
                  profileName: value.data.data!.email.toString());
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          Consumer<ProfileProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return NormalProfile(
                  name: "Phone Number",
                  profileName: value.data.data!.phoneno.toString());
            },
          ),
          SizedBox(
            height: 4.h,
          ),
          ProfileButton(
              name: "Edit Profile",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileUpdate();
                }));
              })
        ],
      ),
    );
  }
}
