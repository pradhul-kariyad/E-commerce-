import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/commonWidget/builderUsers/listviewUsers.dart';
import 'package:sizer/sizer.dart';

class StackCategory2 extends StatelessWidget {
  const StackCategory2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: SizedBox(
        // color: Colors.amberAccent,
        width: 100.w,
        height: 32.h,
        child: ListView.builder(
            itemCount: users.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          // color: ColorData.pink,
                          width: 20.w,
                          height: 30.h,
                        ),
                        Container(
                          width: 40.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorData.wgrey),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              image: DecorationImage(
                                  image: AssetImage(users[index].pic),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 26.w, bottom: 12.h),
                            child: IconButton(
                                onPressed: () {
                                  // ignore: avoid_print
                                  print("favorite button");
                                },
                                icon: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: 19.sp,
                                )),
                          ),
                        ),
                        Positioned(
                          top: 17.9.h,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorData.wgrey),
                                // color: ColorData.greyColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6))),
                            width: 39.9.w,
                            height: 8.5.h,
                          ),
                        ),

                        Positioned(
                          bottom: 8.7.h,
                          left: 32.w,
                          child: Text(
                            users[index].review,
                            style: TextStyle(color: (Colors.grey)),
                          ),
                        ),
                        Positioned(
                          bottom: 6.6.h,
                          left: 22.w,
                          child: IconButton(
                              onPressed: () {
                                // ignore: avoid_print
                                print("star icon");
                              },
                              icon: Icon(
                                Icons.star_outlined,
                                color: Colors.yellow,
                                size: 13.sp,
                              )),
                        ),
                        // Positioned(
                        //   bottom: 5.7.h,
                        //   left: 2.3.w,
                        //   child: Text(
                        //     users[index].subName,
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.w400, fontSize: 10.sp),
                        //   ),
                        // ),
                        Positioned(
                            bottom: 6.h,
                            left: 4.w,
                            child: Text(
                              users[index].price,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )),
                        Positioned(
                          left: 3.w,
                          bottom: 8.7.h,
                          child: Text(
                            users[index].name,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: ColorData.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Positioned(
                        //   right: 2.w,
                        //   bottom: 1.5.h,
                        //   child: IconButton(
                        //       onPressed: () {
                        //         // ignore: avoid_print
                        //         print("control button");
                        //       },
                        //       icon: Icon(
                        //         Icons.control_point_rounded,
                        //         size: 22.sp,
                        //         color: Colors.pink,
                        //       )),
                        // )
                      ],
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
