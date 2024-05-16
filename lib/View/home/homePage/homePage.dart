// ignore_for_file: unused_import, sort_child_properties_last, prefer_final_fields, file_names, unused_local_variable
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mainproject/cart/cartPage/cartPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/invoiceDownloadProvider/invoiceDownloadProvider.dart';
import 'package:mainproject/providers/ordersHistory/orderHistoryService.dart';
import 'package:mainproject/providers/ordersHistory/ordersHistoryProvider.dart';
import 'package:mainproject/providers/paginationProvider/paginationDataProvider.dart';
import 'package:mainproject/providers/profileProvider/themeProvider/themeChangeProvidert.dart';
import 'package:mainproject/providers/profileProvider/themeProvider/themeProvider.dart';
import 'package:mainproject/theme/theme.dart';
import 'package:mainproject/view/pages/productListPage/productListPage.dart';
import 'package:mainproject/view/pages/searchPage/customSearchDelegate/customSearchDelegate.dart';
import 'package:mainproject/view/pages/searchPage/searchPage.dart';
import 'package:mainproject/view/home/electronicsPage/electronics.dart';
import 'package:mainproject/models/examples/exampleView.dart';
import 'package:mainproject/view/home/electronicsPage/homeElectronics.dart';
import 'package:mainproject/view/home/fancyPage/fancy.dart';
import 'package:mainproject/view/home/fancyPage/homeFancy.dart';
import 'package:mainproject/view/home/fasionPage/homeFasion.dart';
import 'package:mainproject/view/home/jwelleryPage/homeJwellery.dart';
import 'package:mainproject/view/home/jwelleryPage/jwellery.dart';
import 'package:mainproject/providers/bannerProvider/bannerDataProvider.dart';
import 'package:mainproject/providers/cartProvider/cartDataProvider/cartDataProvider.dart';
import 'package:mainproject/providers/checkOutProvider/checkOutProvider.dart';
import 'package:mainproject/providers/homeProvider/homeDataProvider.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/view/home/fasionPage/fasion.dart';
import 'package:mainproject/providers/orderCreationProvider/orderCreation.dart';
import 'package:mainproject/providers/searchProvider/searchDataProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishListDataProvider/wishListDataProvider.dart';
import 'package:mainproject/view/home/banner/bannerSlider.dart';
import 'package:mainproject/view/pages/profile/profilePage.dart';
import 'package:mainproject/view/widgets/builderUsers/stackCategory.dart';
import 'package:mainproject/view/widgets/builderUsers/stackCategory2.dart';
import 'package:mainproject/models/examples/examples.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/view/widgets/myButton.dart';
import 'package:mainproject/view/widgets/pageview/page1.dart';
import 'package:mainproject/view/widgets/pageview/page2.dart';
import 'package:mainproject/view/widgets/pageview/page3.dart';
import 'package:mainproject/wishlist/wishListPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeDataProvider>().getAllPosts();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SearchDataProvider>();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("SwiftCart")),
        elevation: 0,
        backgroundColor: ColorData.red,
      ),
      body: RefreshIndicator(
        color: ColorData.red,
        onRefresh: _refresh,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorData.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(23),
                          bottomRight: Radius.circular(23))),
                  width: MediaQuery.of(context).size.width,
                  height: 15.h,
                ),
                Positioned(
                  top: 3.h,
                  right: 5.w,
                  child: Consumer<ThemeIconProvider>(
                    builder: (BuildContext context, icon, Widget? child) {
                      return Consumer<ThemeProvider>(
                        builder: (BuildContext context, theme, Widget? child) {
                          return Container(
                            child: IconButton(
                                onPressed: () {
                                  theme.getTheme() == darkMode;
                                  toggleTheme(context);
                                  icon.changeIcon();
                                },
                                icon: Icon(
                                  icon.favorite,
                                  color: ColorData.red,
                                  size: 22,
                                )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorData.white,
                            ),
                            width: 10.w,
                            height: 5.h,
                          );
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                    left: 3.w,
                    top: 3.h,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return SearchPage();
                        // }));
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 3.w),
                        width: 80.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            color: ColorData.white,
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.manage_search_sharp,
                              color: ColorData.red,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                  color: ColorData.grey, fontSize: 13.sp),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),

            SizedBox(
              height: 1.4.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 1.2.h, left: 2.h),
                  child: Text(
                    "#SpecialForYou",
                    style: TextStyle(
                        color: ColorData.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 1.2.h, right: 2.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductListPage();
                      }));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          color: ColorData.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ),
                )
              ],
            ),

            //
            // BannerSlider

            Container(
                margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                width: double.infinity,
                height: 31.h,
                child: BannerSlider()),

            // BannerSlider

            // SizedBox(
            //     width: 100.w,
            //     height: 29.h,
            //     child: PageView(
            //       controller: _pageController,
            //       children: [Page1(), Page2(), Page3()],
            //     )
            //     //  PageView.builder(
            //     //   controller: _pageController,
            //     //   // itemCount: ,
            //     //   itemBuilder: (context, index) {
            //     //     Page1(image: "");

            //     //   },

            //     // ),
            //     ),
            // SmoothPageIndicator(
            //     axisDirection: Axis.horizontal,
            //     //effect: WormEffect,
            //     //effect: SwapEffect,
            //     //effect: JumpingDotEffect,verticalOffset: 4,
            //     //effect: SlideEffect,
            //     effect: WormEffect(
            //         // verticalOffset: 4,
            //         spacing: 4.sp,
            //         dotHeight: 1.1.h,
            //         dotWidth: 3.8.w,
            //         // radius: 10,
            //         dotColor: ColorData.red.withOpacity(.5),
            //         activeDotColor: ColorData.red),
            //     controller: _pageController,
            //     count: 3),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "Category",
                    style: TextStyle(
                        color: ColorData.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 2.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductListPage();
                      }));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          color: ColorData.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                HomeElectronics(),
                HomeFasion(),
                HomeFancy(),
                HomeJwellery()
              ],
            ),
            // IconButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return ProductListPage();
            //       }));
            //     },
            //     icon: Icon(Icons.abc_outlined)),
            // StackCategory(),
            Padding(
              padding: EdgeInsets.only(top: 5.h, right: 56.w, bottom: 1.h),
              child: Text(
                "Products For You",
                style: TextStyle(
                    color: ColorData.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
            ),
            SizedBox(width: 100.w, height: 33.h, child: Electronics()),
            SizedBox(width: 100.w, height: 33.h, child: Fasion()),
            SizedBox(width: 100.w, height: 33.h, child: Jwellery()),
            SizedBox(width: 100.w, height: 33.h, child: Fancy()),
            // StackCategory2(),
          ],
        )),
      ),
    );
  }

  Future<void> _refresh() {
    context.read<HomeDataProvider>().getAllPosts();
    context.read<BannerDataProvider>().getAllPosts();
    return Future.delayed(Duration(seconds: 1));
  }
}
