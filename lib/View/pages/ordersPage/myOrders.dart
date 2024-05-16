// ignore_for_file: file_names, unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/ordersHistory/ordersHistoryProvider.dart';
import 'package:mainproject/view/pages/profile/profilePage.dart';
import 'package:mainproject/view/pages/ordersPage/trackOrder.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<OrdersHistoryProvider>().getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() {
      context.read<OrdersHistoryProvider>().getAllPosts();
      return Future.delayed(Duration(seconds: 1));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.red,
        automaticallyImplyLeading: true,

        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return ProfilePage();
        //     }));
        //   },
        //   icon: Icon(Icons.arrow_back, color: ColorData.white),
        // ),
        title: Center(
          widthFactor: 2.2.sp,
          child: Text(
            "My Orders",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: ColorData.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 90.h,
            child: Consumer<OrdersHistoryProvider>(
              builder: (BuildContext context, history, Widget? child) {
                if (history.isloading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorData.grey,
                    ),
                  );
                }
                var orders = history.orderHistory.order ?? [];
                if (orders.isEmpty) {
                  return Center(
                    child: Text(
                      "No order history available",
                      style: TextStyle(color: ColorData.grey),
                    ),
                  );
                }
                var item = history.orderHistory.order ?? [];
                return RefreshIndicator(
                  onRefresh: _refresh,
                  color: ColorData.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: item.length,
                    itemBuilder: (context, index) {
                      var product = item[index].items![0].product;
                      // if (history.isloading) {
                      //   return Center(
                      //     child: CircularProgressIndicator(),
                      //   );
                      // }
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
                                  left: 5.w,
                                  child: Container(
                                    width: 36.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.sp, color: ColorData.wgrey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(11)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'http://$ip:3000/products-images/${product!.image}'),
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
                                  top: 10.h,
                                  right: 10.w,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 4.h,
                                        width: 20.w,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(ColorData.red),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)))),
                                            onPressed: () async {
                                              var order = item[index];
                                              var product =
                                                  order.items![0].product!;

                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return TrackOrder(
                                                  productImage:
                                                      product.image.toString(),
                                                  productName:
                                                      product.name.toString(),
                                                  productPrice:
                                                      product.price.toString(),
                                                  name: order.name.toString(),
                                                  address:
                                                      order.address.toString(),
                                                  shipped: order.orderdate
                                                      .toString(),
                                                  orderID: order.orderId,
                                                  // orderId: orderId.toString(),
                                                );
                                              }));
                                            },
                                            child: Text(
                                              "Track Order",
                                              style: TextStyle(
                                                  color: ColorData.white,
                                                  fontSize: 6.sp),
                                            )),
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
                );
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ]),
      ),
    );
  }
}
