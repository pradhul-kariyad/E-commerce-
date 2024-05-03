// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, sort_child_properties_last, unused_import
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/searchProvider/searchDataProvider.dart';
import 'package:mainproject/view/pages/searchPage/searchProduct.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/home/profile/profilePage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var _searchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          leading: Text(""),
          // leading: InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return ProfilePage();
          //     }));
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 6.w),
          //     child: CircleAvatar(
          //       backgroundImage: AssetImage("assets/images/hoodie.PNG"),
          //       radius: 2.sp,
          //       backgroundColor: ColorData.white,
          //     ),
          //   ),
          // ),
          title: Padding(
            padding: EdgeInsets.only(left: 18.w),
            child: Text("SwiftCart"),
          ),
          elevation: 0,
          backgroundColor: ColorData.red,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                      left: 3.w,
                      top: 3.h,
                      child: Consumer<SearchDataProvider>(
                        builder: (BuildContext context, search, Widget? child) {
                          return Container(
                            width: 92.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                                color: ColorData.white,
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: TextFormField(
                              onChanged: (value) {
                                search.getAllPosts(value);
                              },
                              // controller: _searchController,
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 204, 204)),
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.manage_search_outlined,
                                        color: ColorData.red,
                                      ))),
                            ),
                          );
                        },
                      )),
                ],
              ),
              Consumer<SearchDataProvider>(
                builder: (BuildContext context, search, Widget? child) {
                  if (search.isloading) {
                    return Center(
                      heightFactor: 0.2.h,
                      child: CircularProgressIndicator(
                        strokeAlign: -4,
                        color: ColorData.grey,
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(top: 5.h),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 2,
                          // mainAxisSpacing: 1,
                          // mainAxisExtent: 3,
                          // crossAxisSpacing: 1
                        ),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: search.searchModel.searchitems?.length ?? 0,
                        itemBuilder: (context, index) {
                          var product = search.searchModel.searchitems?[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SearchProduct(
                                    productName: product.name.toString(),
                                    productImage: product.image.toString(),
                                    productPrice: product.price.toString(),
                                    productId: product.id.toString());
                              }));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 1.h, left: 2.w, right: 2.w),
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
                                        width: 30.w,
                                        height: 19.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorData.wgrey),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                topRight: Radius.circular(6)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'http://$ip:3000/products-images/${product!.image!}'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                        top: 18.9.h,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ColorData.wgrey),
                                              // color: ColorData.greyColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(6),
                                                  bottomRight:
                                                      Radius.circular(6))),
                                          width: 29.2.w,
                                          height: 7.h,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 6.h,
                                          left: 2.w,
                                          child: Text(
                                            'Price : ${product.price}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8.sp,
                                            ),
                                          )),
                                      Positioned(
                                        left: 2.w,
                                        bottom: 8.3.h,
                                        child: Text(
                                          product.name ?? "",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: ColorData.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
