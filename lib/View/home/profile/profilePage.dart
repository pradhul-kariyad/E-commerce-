// ignore_for_file: avoid_print, unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/cart/cartPage/cartPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/auth/logOutProvider.dart';
import 'package:mainproject/providers/profileProvider/profileProvider.dart';
import 'package:mainproject/providers/profileProvider/profileService.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/home/profile/profileUpdate.dart';
import 'package:mainproject/view/home/profile/yourProfile.dart';
import 'package:mainproject/view/pages/ordersPage/myOrders.dart';
import 'package:mainproject/view/widgets/profileForm/proflieText.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerOperator =
        Provider.of<ProfileProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      providerOperator.getAllPosts();
    });
    // context.read<ProfileProvider>().getAll();
    return Scaffold(
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(9.sp),
      //     topRight: Radius.circular(9.sp),
      //   ),
      //   child: NavigationBar(
      //       // surfaceTintColor: ColorData.pink,
      //       // elevation: 6,
      //       indicatorColor: ColorData.grey,
      //       backgroundColor: ColorData.white,
      //       height: 8.h,
      //       destinations: [
      //         IconButton(
      //             onPressed: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) {
      //                 return HomePage();
      //               }));
      //               print("home page");
      //             },
      //             icon: Icon(
      //               Icons.home_rounded,
      //               size: 24.sp,
      //               color: ColorData.red,
      //             )),
      //         IconButton(
      //             onPressed: () {
      //               print("favorite page");
      //             },
      //             icon: Icon(
      //               Icons.favorite_border_rounded,
      //               color: ColorData.red,
      //             )),
      //         IconButton(
      //             onPressed: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) {
      //                 return CartPage();
      //               }));
      //               print("card page");
      //             },
      //             icon: Icon(
      //               Icons.add_shopping_cart_sharp,
      //               color: ColorData.red,
      //             )),
      //         IconButton(
      //             onPressed: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) {
      //                 return ProfilePage();
      //               }));
      //               print("profile page");
      //             },
      //             icon: Icon(
      //               Icons.account_circle,
      //               size: 26.sp,
      //               color: ColorData.red,
      //             )),
      //       ]),
      // ),
      appBar: AppBar(
        backgroundColor: ColorData.red,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainPage();
              }));
            },
            icon: Icon(Icons.arrow_back, color: ColorData.white)),
        title: Center(
          widthFactor: 2.9.sp,
          child: Text(
            "Profile",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: ColorData.white),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Center(
              child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/hoodie.PNG"),
            radius: 50.sp,
          )),

          Consumer<ProfileProvider>(
            builder: (BuildContext context, profile, Widget? child) {
              if (profile.isloading) {
                return Center(
                  heightFactor: 0.4.h,
                  child: CircularProgressIndicator(
                    strokeAlign: -5,
                    // value: 1,
                    // backgroundColor: ColorData.black,
                    color: ColorData.grey,
                  ),
                );
              }
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.h),
                    child: Center(
                      child: Text(
                        profile.data.data?.name ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Center(
                    child: Text(
                      profile.data.data?.email ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 8.sp),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              );
            },
          ),

          ProfileText(
            name: "Edit profile",
            icon: Icons.person,
            iconData: Icons.arrow_forward_ios_sharp,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileUpdate();
              }));
            },
            iconTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileUpdate();
              }));
            },
          ),
          // SizedBox(
          //   height: 1.h,
          // ),
          // ProfileText(
          //   name: "Manage Address",
          //   icon: Icons.location_on_rounded,
          //   iconData: Icons.arrow_forward_ios_sharp,
          //   onTap: () {},
          //   iconTap: () {},
          // ),
          SizedBox(
            height: 1.h,
          ),
          ProfileText(
            name: "My Order",
            icon: Icons.aod_rounded,
            iconData: Icons.arrow_forward_ios_sharp,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyOrders();
              }));
            },
            iconTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyOrders();
              }));
            },
          ),
          SizedBox(
            height: 1.h,
          ),
          ProfileText(
            name: "Log out",
            icon: Icons.logout,
            iconData: Icons.arrow_forward_ios_sharp,
            onTap: () {
              LogOutProvider().logout(context);
            },
            iconTap: () {},
          ),
        ],
      ),
    );
  }
}
