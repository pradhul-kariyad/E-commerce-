import 'package:flutter/material.dart';
import 'package:mainproject/providers/homeProvider/homeDataProvider.dart';
import 'package:provider/provider.dart';

class Last extends StatelessWidget {
  const Last({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerOperator =
        Provider.of<HomeDataProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      providerOperator.getAllPosts();
    });

    return Scaffold(
      body: Consumer<HomeDataProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isloading) {
            return const Center(child: CircularProgressIndicator());
          }
          final categorizedProducts = value.categorizedProducts;
          return SizedBox(
            height: 500,
            width: 200,
            child: ListView.builder(
              itemCount:
                  categorizedProducts.categorizedProducts?.fancy?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(categorizedProducts
                          .categorizedProducts!.fancy?[index].price
                          .toString() ??
                      ""),
                  title: Text(categorizedProducts
                          .categorizedProducts?.fancy?[index].qty
                          .toString() ??
                      ""),
                  subtitle: Text(categorizedProducts
                          .categorizedProducts?.fancy?[index].id ??
                      ""),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
