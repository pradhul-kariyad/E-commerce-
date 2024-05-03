// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings, file_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/allProductModel/all_product_model/all_product_model.dart';
import 'package:mainproject/models/productModel/post.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';
import 'package:mainproject/providers/paginationProvider/paginationService.dart';

class PaginationDataProvider extends ChangeNotifier {
  final service = PaginationService();
  bool isloading = false;
  AllProductModel _categorizedProducts = AllProductModel();
  AllProductModel get categorizedProducts => _categorizedProducts;
  getAllPosts(addPage) async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll(addPage);
    _categorizedProducts = res;
    isloading = false;
    notifyListeners();
  }
}
