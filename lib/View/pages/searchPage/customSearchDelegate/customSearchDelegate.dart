// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/searchProvider/searchDataProvider.dart';
import 'package:mainproject/view/pages/searchPage/searchProduct.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  TextStyle get searchFieldStyle => TextStyle(
        fontSize: 14.sp, // Adjust the font size as needed
        color: ColorData.white,
      );

  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
        border: InputBorder.none, // Remove underline
        focusedBorder: InputBorder.none, // Remove underline on focus
        enabledBorder: InputBorder.none, // Remove underline when enabled
        hintStyle: TextStyle(color: ColorData.white),
      );

  InputDecoration get searchFieldDecoration => InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintStyle: TextStyle(color: ColorData.white),
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorData.red, // Set your desired appbar color here
        titleTextStyle: TextStyle(
          fontSize: 15.sp, // Adjust the font size as needed
          color: Colors.white, // Set your desired title color here
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: searchFieldDecorationTheme,
    );
  }

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
    // Ensure to update the results based on the query
    context.read<SearchDataProvider>().getAllPosts(query, refresh: true);
    return SearchPagee();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      context.read<SearchDataProvider>().getAllPosts(query, refresh: true);
    }
    return SearchPagee();
  }
}

class SearchPagee extends StatefulWidget {
  const SearchPagee({Key? key}) : super(key: key);

  @override
  State<SearchPagee> createState() => _SearchPageeState();
}

class _SearchPageeState extends State<SearchPagee> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchDataProvider>();
    });
  }

  Future<void> _refresh() async {
    context.read<SearchDataProvider>().getAllPosts('', refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchDataProvider>(
      builder: (BuildContext context, search, Widget? child) {
        if (search.isloading) {
          return Center(
              child: CircularProgressIndicator(color: ColorData.grey));
        } else if (search.searchModel.searchitems == null ||
            search.searchModel.searchitems!.isEmpty) {
          return Center(
            child: Text(
              "No results found",
              style: TextStyle(
                  fontSize: 13.sp, color: Color.fromARGB(255, 206, 202, 202)),
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: _refresh,
            color: ColorData.red,
            child: Container(
              margin: EdgeInsets.only(top: 5.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 2,
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
                            productId: product.id.toString(),
                          );
                        }));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
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
                                      topRight: Radius.circular(6),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'http://$ip:3000/products-images/${product!.image!}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 18.9.h,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: ColorData.wgrey),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                    ),
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
                                  ),
                                ),
                                Positioned(
                                  left: 2.w,
                                  bottom: 8.3.h,
                                  child: Text(
                                    product.name ?? "",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: ColorData.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
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
            ),
          );
        }
      },
    );
  }
}
