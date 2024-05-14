// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/cart/CheckoutPage/checkoutPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/cartProvider/cartDataProvider/cartDataProvider.dart';
import 'package:mainproject/providers/cartProvider/deleteCart/deleteCartProvider.dart';
import 'package:mainproject/providers/cartProvider/quantityAdd/quantityAddProvider.dart';
import 'package:mainproject/providers/cartProvider/quantityMinus/quantityMinusProvider.dart';
import 'package:mainproject/providers/checkOutProvider/checkOutProvider.dart';
import 'package:mainproject/view/home/homePage/homePage.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/home/profile/profilePage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CartDataProvider>().getAllPosts();
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
            "My Cart",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorData.white,
            ),
          ),
        ),
      ),
      body: Consumer<CartDataProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isloading) {
            return Center(
                child: CircularProgressIndicator(color: ColorData.grey));
          }
          var item = value.cartModel.data;

          if (item == null || item.items?.isEmpty == true) {
            return Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(
                    fontSize: 13.sp, color: Color.fromARGB(255, 206, 202, 202)),
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 66.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: item.items!.length,
                  itemBuilder: (context, index) {
                    var product = item.items![index].product!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 1.h),
                                width: double.infinity,
                                height: 22.h,
                              ),
                              Positioned(
                                top: 2.h,
                                left: 9.5.w,
                                child: Container(
                                  width: 31.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'http://$ip:3000/products-images/${product.image!}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 6.h,
                                left: 45.w,
                                child: Row(
                                  children: [
                                    Text(
                                      product.name.toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorData.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 15.h,
                                left: 45.w,
                                child: Row(
                                  children: [
                                    Text(
                                      'Price : ${product.price}',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorData.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10.1.h,
                                right: 4.w,
                                child: Consumer<DeleteCartProvider>(
                                  builder: (BuildContext context, delete,
                                      Widget? child) {
                                    return InkWell(
                                      onTap: () async {
                                        delete.delete(product.id, context);
                                      },
                                      child: Icon(
                                        Icons.delete_outline_outlined,
                                        color: ColorData.red,
                                        size: 22.sp,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 10.2.h,
                                right: 15.w,
                                child: Row(
                                  children: [
                                    Consumer<QuantityMinusProvider>(
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return InkWell(
                                          onTap: () async {
                                            await value.quantityMinus(
                                                product.id, context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorData.grey,
                                              borderRadius:
                                                  BorderRadius.circular(4.sp),
                                            ),
                                            width: 6.w,
                                            height: 3.h,
                                            child: Icon(Icons.remove,
                                                size: 14.sp,
                                                color: ColorData.black),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      child: Text(
                                        value.cartModel.data!.items![index]
                                            .quantity
                                            .toString(),
                                        style: TextStyle(
                                          color: ColorData.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    Consumer<QuantityAddProvider>(
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return InkWell(
                                          onTap: () async {
                                            await value.quantityAdd(
                                                product.id, context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorData.red,
                                              borderRadius:
                                                  BorderRadius.circular(4.sp),
                                            ),
                                            width: 6.w,
                                            height: 3.h,
                                            child: Icon(Icons.add,
                                                size: 14.sp,
                                                color: ColorData.white),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: Divider(
                              endIndent: 5.w,
                              indent: 5.w,
                              color: Color.fromARGB(255, 196, 187, 187),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Delivery charge : 40",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorData.black,
                    fontSize: 10.sp),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 1.4.h),
                child: Text(
                  "Total Price :   ${value.cartModel.total}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: ColorData.black),
                ),
              ),
              SizedBox(
                width: 60.w,
                height: 5.5.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(ColorData.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CheckoutPage();
                      }));
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: ColorData.white),
                    )),
              ),
            ]),
          );
        },
      ),
    );
  }
}
