// ignore_for_file: unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/paginationProvider/paginationDataProvider.dart';
import 'package:mainproject/view/home/electronicsPage/electronicsPage.dart';
import 'package:mainproject/view/pages/searchPage/customSearchDelegate/customSearchDelegate.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaginationDataProvider>(context, listen: false)
          .getAllPosts(1);
    });
    // context.read<PaginationDataProvider>().getAllPosts(1);
  }

  @override
  Widget build(BuildContext context) {
    log("Page Reaload");
    Future<void> _refresh() {
      context.read<PaginationDataProvider>().getAllPosts(1);
      return Future.delayed(Duration(seconds: 1));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.red,
        automaticallyImplyLeading: true,
        title: Center(
          widthFactor: 1.8.sp,
          child: Text(
            "All Product",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorData.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search_outlined),
            color: ColorData.white,
          ),
          SizedBox(
            width: 1.w,
          ),
        ],
      ),
      body: Consumer<PaginationDataProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.allProducts.product!.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !provider.isLoading &&
                  provider.hasMore) {
                provider.loadMore();
              }
              return false;
            },
            child: RefreshIndicator(
              color: ColorData.red,
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: provider.allProducts.product!.length + 1,
                itemBuilder: (context, index) {
                  if (index == provider.allProducts.product!.length) {
                    if (provider.isLoading) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeAlign: -3,
                            color: ColorData.grey,
                          ),
                        ),
                      );
                    } else if (!provider.hasMore) {
                      return Padding(
                        padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                        child: Center(
                            child: Text(
                          "No more products",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 220, 217, 217)),
                        )),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }
                  var product = provider.allProducts.product![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ElectronicsPage(
                            productName: product.name.toString(),
                            productImage: product.image.toString(),
                            productPrice: product.price.toString(),
                            productId: product.id.toString());
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 1.9.h, right: 3.7.w, left: 3.7.w),
                      padding: EdgeInsets.only(top: 2.h),
                      decoration: BoxDecoration(
                          color: ColorData.wgrey,
                          borderRadius: BorderRadius.circular(12.sp)),
                      height: 15.h,
                      width: 50.w,
                      child: ListTile(
                        leading: Image.network(
                            'http://$ip:3000/products-images/${product.image!}'),
                        title: Text(
                          product.name ?? 'No name',
                          style: TextStyle(
                              fontSize: 13.sp, color: ColorData.black),
                        ),
                        subtitle: Text(
                          "Price : ${product.price}",
                          style:
                              TextStyle(fontSize: 9.sp, color: ColorData.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
