// ignore_for_file: file_names, unused_local_variable, unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/cart/cartPage/cartPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/currentPageProvider/currentPageProvider.dart';
import 'package:mainproject/view/pages/searchPage/searchPage.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/pages/profile/profilePage.dart';
import 'package:mainproject/wishlist/wishListPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> pages = const [
    const HomePage(),
    const WishListPage(),
    const CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CurrentPageProvider>(
        builder: (context, provider, child) {
          return pages[provider.currentPage];
        },
      ),
      bottomNavigationBar: Consumer<CurrentPageProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            // mouseCursor: SystemMouseCursors.allScroll,
            useLegacyColorScheme: false,
            enableFeedback: true,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: provider.currentPage,
            onTap: (value) {
              provider.setCurrentPage(value);
            },
            iconSize: 22.sp,
            unselectedItemColor: ColorData.red,
            selectedItemColor: ColorData.red,
            elevation: 5.h,
            items: const [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_rounded,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: '',
              ),
            ],
          );
        },
      ),
    );
  }
}
