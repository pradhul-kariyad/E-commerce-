import 'product.dart';

class AllProductModel {
  List<Product>? product;
  int? totalPages;
  int? currentPage;
  List<int>? pages;

  AllProductModel({
    this.product,
    this.totalPages,
    this.currentPage,
    this.pages,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      pages: json['pages'] as List<int>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product?.map((e) => e.toJson()).toList(),
        'totalPages': totalPages,
        'currentPage': currentPage,
        'pages': pages,
      };
}
