// ignore_for_file: file_names, avoid_print, unused_import, unnecessary_brace_in_string_interps
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/cartProvider/addCart/addCartProvider.dart';
import 'package:mainproject/providers/wishListProvider/favoriteProvider/favoriteProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishListDataProvider/wishListDataProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishlistView.dart/wishListViewProvider.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ElectronicsPage extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productId;
  const ElectronicsPage(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          widthFactor: 1.5.sp,
          child: Text(
            "Product Details",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: ColorData.white),
          ),
        ),
        actions: [
          Consumer(
            builder: (BuildContext context, value, Widget? child) {
              return Consumer<FavoriteProvider>(
                builder: (BuildContext context, favorite, Widget? child) {
                  return Consumer<WishListViewProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return IconButton(
                          onPressed: () {
                            context.read<FavoriteProvider>().changeFavorite();
                            value.addAndRemove(productId, context);
                            context.read<WishListDataProvider>().getAllPosts();
                          },
                          icon: Icon(
                            favorite.favorite,
                            color: ColorData.white,
                          ));
                    },
                  );
                },
              );
            },
          ),
          SizedBox(
            width: 1.w,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 2.h,
            ),
            width: 95.w,
            height: 60.h,
            decoration: BoxDecoration(
                // border: Border.all(color: ColorData.wgrey),
                borderRadius: BorderRadius.circular(5.sp),
                image: DecorationImage(
                    image: NetworkImage(
                        'http://$ip:3000/products-images/${productImage}'),
                    fit: BoxFit.cover)),
          ),
          Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 16.h,
                // color: ColorData.pink,
              ),
              Positioned(
                left: 5.w,
                top: 4.h,
                child: Text(
                  productName,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: ColorData.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 9.h,
                left: 6.w,
                child: Text(
                  "Price : ${productPrice}",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorData.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55,
            width: 90.w,
            child: Consumer<AddCartProvider>(
              builder: (BuildContext context, cart, Widget? child) {
                return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(ColorData.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12.sp)))),
                    onPressed: () {
                      cart.add(productId, context);
                      print("Add to Cart");
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: ColorData.white, fontSize: 11.sp),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
