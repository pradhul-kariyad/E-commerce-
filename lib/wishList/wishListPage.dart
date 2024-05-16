// ignore_for_file: use_build_context_synchronously, avoid_print, unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/wishListProvider/wishListDataProvider/wishListDataProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishlistView.dart/wishListViewProvider.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/wishList/wishLishProduct.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<WishListDataProvider>().getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.red,
        automaticallyImplyLeading: false,
        title: Center(
          // widthFactor: 2.6.sp,
          child: Text(
            "Wishlist",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorData.white,
            ),
          ),
        ),
      ),
      body: Consumer<WishListDataProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isloading) {
            return Center(
                child: CircularProgressIndicator(color: ColorData.grey));
          }
          var wishListModel = value.wishListModel;

          if (wishListModel.wishlist == null ||
              wishListModel.wishlist!.isEmpty) {
            return Center(
              child: Text(
                "Your wishlist is empty",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 206, 202, 202),
                ),
              ),
            );
          }
          return RefreshIndicator(
            color: ColorData.red,
            onRefresh: _refresh,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 8,
                // mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              itemCount: wishListModel.wishlist!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                final product = wishListModel.wishlist![index].product;

                if (product == null) {
                  return SizedBox(); // Return an empty widget if product is null
                }

                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WishListProduct(
                          productName: product.name.toString(),
                          productImage: product.image.toString(),
                          productPrice: product.price.toString(),
                          productId: product.id.toString());
                    }));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 1.h,
                      left: 2.w,
                      right: 2.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Stack(
                          children: [
                            SizedBox(
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
                                  topRight: Radius.circular(6),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'http://$ip:3000/products-images/${product.image ?? ""}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 26.w, bottom: 12.h),
                                child: Consumer<WishListViewProvider>(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    return IconButton(
                                      onPressed: () async {
                                        await value.addAndRemove(
                                            product.id, context);
                                        context
                                            .read<WishListDataProvider>()
                                            .getAllPosts();
                                        print("favorite button");
                                      },
                                      icon: Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.red,
                                        size: 19.sp,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 17.9.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorData.wgrey),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                ),
                                width: 39.9.w,
                                height: 8.5.h,
                              ),
                            ),
                            Positioned(
                              bottom: 6.h,
                              left: 3.w,
                              child: Text(
                                'Price : ${product.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 9.sp),
                              ),
                            ),
                            Positioned(
                              left: 3.w,
                              bottom: 8.7.h,
                              child: Text(
                                product.name ?? "",
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: ColorData.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Positioned(
                            //   right: 1.w,
                            //   top: 20.h,
                            //   child: IconButton(
                            //     onPressed: () {
                            //       // Add to cart functionality goes here
                            //       print("Add to cart button");
                            //     },
                            //     icon: Icon(
                            //       Icons.add_shopping_cart_sharp,
                            //       size: 29.sp,
                            //       color: Colors.red,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Future<void> _refresh() {
    context.read<WishListDataProvider>().getAllPosts();
    return Future.delayed(Duration(seconds: 1));
  }
}
