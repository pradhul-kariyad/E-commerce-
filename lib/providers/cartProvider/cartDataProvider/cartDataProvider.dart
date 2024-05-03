// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/bannerModel/banner_model/bannerModel.dart';
import 'package:mainproject/models/cartModel/cart_model/cart_model.dart';
import 'package:mainproject/models/cartModel/cart_model/item.dart';
import 'package:mainproject/providers/bannerProvider/bannerService.dart';
import 'package:mainproject/providers/cartProvider/cartDataProvider/cartService.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';

class CartDataProvider extends ChangeNotifier {
  final service = CartService();
  bool isloading = false;
  CartModel _cartModel = CartModel();
  CartModel get cartModel => _cartModel;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();

    _cartModel = res;

    isloading = false;

    notifyListeners();
  }
}
