// ignore_for_file: use_build_context_synchronously, unused_import
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/cartProvider/addCart/addCartProvider.dart';
import 'package:mainproject/providers/homeProvider/homeDataProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishListDataProvider/wishListDataProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishlistView.dart/wishListViewProvider.dart';
import 'package:mainproject/view/home/fancyPage/fancyPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Fancy extends StatelessWidget {
  const Fancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeDataProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isloading) {
            return Center(
                child: CircularProgressIndicator(color: ColorData.grey));
          }
          final categorizedProducts = value.categorizedProducts;
          return Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: ListView.builder(
                itemCount: categorizedProducts
                        .categorizedProducts?.electronics?.length ??
                    0,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  final fancy =
                      categorizedProducts.categorizedProducts?.fancy![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FancyPage(
                          productName: fancy.name.toString(),
                          productImage: fancy.image.toString(),
                          productPrice: fancy.price.toString(),
                          productId: fancy.id.toString(),
                        );
                      }));
                    },
                    child: Padding(
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
                                        image: NetworkImage(
                                            'http://$ip:3000/products-images/${fancy!.image!}'),
                                        fit: BoxFit.cover)),
                                // child: Padding(
                                //   padding:
                                //       EdgeInsets.only(left: 26.w, bottom: 12.h),
                                //   child: Consumer<WishListViewProvider>(
                                //     builder: (BuildContext context, value,
                                //         Widget? child) {
                                //       return IconButton(
                                //           onPressed: () {
                                //             value.addAndRemove(fancy.id, context);
                                //             context
                                //                 .read<WishListDataProvider>()
                                //                 .getAllPosts();
                                //             // ignore: avoid_print
                                //             print("favorite button");
                                //           },
                                //           icon: Icon(
                                //             Icons.favorite_rounded,
                                //             color: Colors.red,
                                //             size: 19.sp,
                                //           ));
                                //     },
                                //   ),
                                // ),
                              ),
                              Positioned(
                                top: 17.9.h,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: ColorData.wgrey),
                                      // color: ColorData.greyColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(6),
                                          bottomRight: Radius.circular(6))),
                                  width: 39.9.w,
                                  height: 8.5.h,
                                ),
                              ),
                              //
                              // fasion.price;

                              // Positioned(
                              //   bottom: 8.7.h,
                              //   left: 32.w,
                              //   child: Text(
                              //     '\$ ${fancy.price}',
                              //     style: TextStyle(color: (Colors.grey)),
                              //   ),
                              // ),
                              // .star_outlined;
                              //

                              //
                              // Positioned(
                              //   bottom: 6.6.h,
                              //   left: 22.w,
                              //   child: IconButton(
                              //       onPressed: () {
                              //         // ignore: avoid_print
                              //         print("star icon");
                              //       },
                              //       icon: Icon(
                              //         Icons.star_outlined,
                              //         color: Colors.yellow,
                              //         size: 13.sp,
                              //       )),
                              // ),
                              // Positioned(
                              //   bottom: 5.7.h,
                              //   left: 2.3.w,
                              //   child: Text(
                              //     "\$ ${fancy.price}",
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.w400, fontSize: 10.sp),
                              //   ),
                              // ),
                              Positioned(
                                  bottom: 6.h,
                                  left: 3.w,
                                  child: Text(
                                    'Price : ${fancy.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9.sp),
                                  )),
                              Positioned(
                                left: 3.w,
                                bottom: 8.7.h,
                                child: Text(
                                  fancy.name ?? "",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: ColorData.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              // Positioned(
                              //   right: 1.w,
                              //   top: 20.h,
                              //   child: Consumer<AddCartProvider>(
                              //     builder: (BuildContext context, value,
                              //         Widget? child) {
                              //       return IconButton(
                              //           onPressed: () {
                              //             value.add(fancy.id, context);
                              //             // ignore: avoid_print
                              //             print("control button");
                              //           },
                              //           icon: Icon(
                              //             Icons.add_shopping_cart_sharp,
                              //             size: 29.sp,
                              //             color: Colors.red,
                              //           ));
                              //     },
                              //   ),
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
          );
        },
      ),
    );
  }
}
