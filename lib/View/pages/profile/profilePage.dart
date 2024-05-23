// ignore_for_file: avoid_print, unused_import, unused_element
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/cart/cartPage/cartPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/auth/logOutProvider.dart';
import 'package:mainproject/providers/profileProvider/imgProvider/imgProvider.dart';
import 'package:mainproject/providers/profileProvider/profileProvider.dart';
import 'package:mainproject/providers/profileProvider/profileService.dart';
import 'package:mainproject/providers/profileProvider/themeProvider/themeChangeProvidert.dart';
import 'package:mainproject/providers/profileProvider/themeProvider/themeProvider.dart';
import 'package:mainproject/theme/theme.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/pages/profile/profileUpdate.dart';
import 'package:mainproject/view/pages/profile/yourProfile.dart';
import 'package:mainproject/view/pages/ordersPage/myOrders.dart';
import 'package:mainproject/view/widgets/profileForm/profileLightMode.dart';
import 'package:mainproject/view/widgets/profileForm/proflieText.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileProvider>().getAllPosts();
      // providerOperator.getAllPosts();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.read<ImgProvider>();
        // providerOperator.getAllPosts();
      });
    });

    super.initState();
  }

  Future<void> _refreshProfile() async {
    await context.read<ProfileProvider>().getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    log("Page implement");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.red,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: ColorData.white),
          ),
        ),
      ),
      body: RefreshIndicator(
        color: ColorData.red,
        onRefresh: _refreshProfile,
        child: ListView(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Consumer<ImgProvider>(
                builder: (BuildContext context, imgProvider, Widget? child) {
                  if (imgProvider.isLoading) {
                    return CircularProgressIndicator(
                      strokeAlign: -5,
                      color: ColorData.grey,
                    );
                  }
                  return imgProvider.img != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(imgProvider.img!),
                          radius: 50.sp,
                        )
                      : CircleAvatar(
                          backgroundColor: ColorData.white,
                          backgroundImage:
                              AssetImage('assets/images/profileImg.PNG'),
                          radius: 50.sp,
                        );
                },
              ),
            ),
            Consumer<ProfileProvider>(
              builder: (BuildContext context, profile, Widget? child) {
                if (profile.isloading) {
                  return Center(
                    heightFactor: 0.4.h,
                    child: CircularProgressIndicator(
                      strokeAlign: -5,
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
            Consumer<ThemeNameChangeProvider>(
              builder: (BuildContext context, nameChange, Widget? child) {
                return Consumer<ThemeIconProvider>(
                  builder: (BuildContext context, icon, Widget? child) {
                    return Consumer<ThemeProvider>(
                      builder: (BuildContext context, theme, Widget? child) {
                        return ProfileLightMode(
                          name: nameChange.name,
                          icon: icon.favorite,
                          onTap: () {
                            nameChange.changeName();
                            icon.changeIcon();
                            toggleTheme(context);
                          },
                          iconTap: () {
                            toggleTheme(context);
                            icon.changeIcon();
                            nameChange.changeName();
                          },
                          iconData: Icons.light_mode,
                        );
                      },
                    );
                  },
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
      ),
    );
  }
}
