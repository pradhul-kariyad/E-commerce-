// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/productModel/post.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';

class HomeDataProvider extends ChangeNotifier {
  final service = HomeService();
  bool isloading = false;
  Post _categorizedProducts = Post();
  Post get categorizedProducts => _categorizedProducts;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _categorizedProducts = res;
    isloading = false;
    notifyListeners();
  }
}
