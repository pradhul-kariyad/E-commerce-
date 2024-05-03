// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:mainproject/models/examples/exampleProider.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExampleProvider>(builder: (context, provider, child) {
      if (provider.isLoading || provider.homeData == null) {
        // If data is loading or not yet fetched, show loading indicator
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SizedBox(
            // Data is available, proceed with building the UI
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: ListView.builder(
                itemCount:
                    provider.homeData?.categorizedProducts?.fasion?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final fasion =
                      provider.homeData?.categorizedProducts?.fasion![index];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 250,
                            width: 180,
                            // color: const Color.fromARGB(255, 182, 133, 118),
                            child: Stack(
                              children: [
                                Container(
                                  width: 160.0,
                                  height: 160.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'http://$ip:3000/products-images/${fasion!.image!}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 6.w,
                                  // bottom: 10.h,
                                  child: IconButton(
                                    onPressed: () {
                                      // Add your favorite button functionality here
                                      print("favorite button");
                                    },
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.red,
                                      size: 19.sp,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 16.8.h,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        border: Border.all(color: Colors.grey),
                                        // color: ColorData.greyColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(9),
                                            bottomRight: Radius.circular(9))),
                                    width: 38.w,
                                    height: 10.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 75,
                                  left: 8,
                                  child: Text(
                                    fasion.name ?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 55,
                                  left: 8,
                                  child: Text(
                                    '\$ ${fasion.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 2, 2, 2)),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Positioned(
                                  bottom: 35,
                                  left: 8,
                                  child: Text(
                                    fasion.description ?? "",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 8, 8, 8),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 5.w,
                                  bottom: 0.1.h,
                                  child: IconButton(
                                      onPressed: () {
                                        // ignore: avoid_print
                                        print("control button");
                                      },
                                      icon: Icon(
                                        Icons.control_point_rounded,
                                        size: 22.sp,
                                        color: Colors.pink,
                                      )),
                                ),
                                Positioned(
                                  bottom: 0.h,
                                  // left: 18.4.w,
                                  child: IconButton(
                                      onPressed: () {
                                        // ignore: avoid_print
                                        print("star icon");
                                      },
                                      icon: Icon(
                                        Icons.star_outlined,
                                        color: Colors.red,
                                        size: 13.sp,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                        ]),
                  );
                }));
      }
    });
  }
}
