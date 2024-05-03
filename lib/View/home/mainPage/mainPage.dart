// ignore_for_file: file_names, unused_local_variable, unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/cart/cartPage/cartPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/pages/searchPage/searchPage.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/profile/profilePage.dart';
import 'package:mainproject/wishlist/wishListPage.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    // print("Running Pages"),
    const HomePage(),
    // const SearchPage(),
    const WishListPage(),
    const CartPage(),
    const ProfilePage()
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          enableFeedback: true,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // backgroundColor: ColorData.pink,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          iconSize: 22.sp,
          unselectedItemColor: ColorData.red,
          selectedItemColor: ColorData.red,
          elevation: 5.h,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.search,
            //     // color: ColorData.red,
            //     // size: 22.sp,
            //   ),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_rounded,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                // color: ColorData.red,
                // size: 22.sp,
              ),
              label: '',
            ),
          ]),
    );
  }
}
