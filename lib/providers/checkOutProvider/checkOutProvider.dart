// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/bannerModel/banner_model/bannerModel.dart';
import 'package:mainproject/models/cartModel/cart_model/cart_model.dart';
import 'package:mainproject/models/cartModel/cart_model/item.dart';
import 'package:mainproject/models/checkOutModel/checkOutModel.dart';
import 'package:mainproject/providers/bannerProvider/bannerService.dart';
import 'package:mainproject/providers/cartProvider/cartDataProvider/cartService.dart';
import 'package:mainproject/providers/checkOutProvider/chekOutService.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';

class CheckOutProvider extends ChangeNotifier {
  final service = CheckOutService();
  bool isloading = false;
  CheckOutModel _checkOutModel = CheckOutModel();
  CheckOutModel get checkOutModel => _checkOutModel;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();

    _checkOutModel = res;

    isloading = false;
    notifyListeners();
  }
}
