import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/searchProvider/searchDataProvider.dart';
import 'package:mainproject/view/pages/searchPage/searchProduct.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Here you should call your API or perform search operation to get the results
    Provider.of<SearchDataProvider>(context, listen: false).getAllPosts(query);
    return SearchPagee();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        "Search items",
        style: TextStyle(
            fontSize: 13.sp, color: Color.fromARGB(255, 206, 202, 202)),
      ),
    ); // You can leave this empty since you don't need suggestions
  }
}

class SearchPagee extends StatelessWidget {
  const SearchPagee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDataProvider>(
      builder: (BuildContext context, search, Widget? child) {
        if (search.isloading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
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
                                width: 30.w,
                                height: 19.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorData.wgrey),
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
                                      border:
                                          Border.all(color: ColorData.wgrey),
                                      // color: ColorData.greyColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(6),
                                          bottomRight: Radius.circular(6))),
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
            ),
          );
        }
      },
    );
  }
}
