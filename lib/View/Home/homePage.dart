import 'package:flutter/material.dart';
import 'package:mainproject/Colors/colors.dart';
import 'package:mainproject/CommonWidget/BuilderUsers/stackCategory.dart';
import 'package:mainproject/CommonWidget/BuilderUsers/stackCategory2.dart';
import 'package:mainproject/View/Pageview/page1.dart';
import 'package:mainproject/View/Pageview/page2.dart';
import 'package:mainproject/View/Pageview/page3.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final _pageController = PageController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: ColorData.redColor,),
      bottomNavigationBar: NavigationBar(
          indicatorColor: ColorData.greyColor,
          backgroundColor: ColorData.whiteColor,
          destinations: [
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("home page");
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: 24.sp,
                )),
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("favorite page");
                },
                icon: Icon(Icons.favorite_border_rounded)),
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("card page");
                },
                icon: Icon(Icons.card_travel_outlined)),
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("profile page");
                },
                icon: Icon(Icons.contacts_rounded)),
          ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorData.redColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(23),
                        bottomRight: Radius.circular(23))),
                width: MediaQuery.of(context).size.width,
                height: 25.h,
              ),
              Positioned(
                  top: 5.h,
                  left: 3.w,
                  child: Text(
                    "Location",
                    style: TextStyle(color: ColorData.whiteColor),
                  )),
              Positioned(
                  top: 7.h,
                  left: 2.w,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 1.w),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: ColorData.whiteColor,
                        ),
                      ),
                      Text(
                        "New York, USA",
                        style: TextStyle(color: ColorData.whiteColor),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: ColorData.whiteColor,
                          ))
                    ],
                  )),
              Positioned(
                top: 5.6.h,
                right: 3.w,
                child: Container(
                  // ignore: sort_child_properties_last
                  child: IconButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print("notification icon");
                    },
                    icon: Icon(
                      Icons.notifications_rounded,
                      color: ColorData.whiteColor,
                      size: 22,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Color.fromARGB(255, 222, 221, 221).withOpacity(.3),
                  ),
                  width: 10.3.w,
                  height: 5.4.h,
                ),
              ),
              Positioned(
                  left: 3.w,
                  top: 15.h,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorData.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    // ignore: sort_child_properties_last
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 205, 204, 204)),
                          border: InputBorder.none,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.manage_search_outlined,
                                color: ColorData.redColor,
                              ))),
                    ),
                    width: 80.w,
                    height: 5.h,
                  )),
              Positioned(
                top: 15.h,
                right: 5.w,
                child: Container(
                  // ignore: sort_child_properties_last
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_open_sharp,
                        color: ColorData.redColor,
                        size: 22,
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorData.whiteColor,
                  ),
                  width: 10.w,
                  height: 5.h,
                ),
              ),
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
                      color: ColorData.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, bottom: 1.2.h, right: 2.h),
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: ColorData.redColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp),
                ),
              )
            ],
          ),
          SizedBox(
            width: 100.w,
            height: 29.h,
            child: PageView(
              controller: _pageController,
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          SmoothPageIndicator(
              axisDirection: Axis.horizontal,
              //effect: WormEffect,
              //effect: SwapEffect,
              //effect: JumpingDotEffect,verticalOffset: 4,
              //effect: SlideEffect,
              effect: WormEffect(
                  // verticalOffset: 4,
                  spacing: 4.sp,
                  dotHeight: 1.1.h,
                  dotWidth: 3.8.w,
                  // radius: 10,
                  dotColor: ColorData.redColor.withOpacity(.5),
                  activeDotColor: ColorData.redColor),
              controller: _pageController,
              count: 3),
          SizedBox(
            height: 1.8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(
                  "Category",
                  style: TextStyle(
                      color: ColorData.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.h),
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: ColorData.redColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp),
                ),
              ),
            ],
          ),
          StackCategory(),
          Padding(
            padding: EdgeInsets.only(right: 56.w),
            child: Text(
              "Products For You",
              style: TextStyle(
                  color: ColorData.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
          ),
          StackCategory2(),
        ],
      )),
    );
  }
}
