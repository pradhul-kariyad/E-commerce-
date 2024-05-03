// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings, file_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/bannerModel/banner_model/bannerModel.dart';
import 'package:mainproject/models/ordersHistoryModels/order_history/order_history.dart';
import 'package:mainproject/providers/bannerProvider/bannerService.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';
import 'package:mainproject/providers/ordersHistory/orderHistoryService.dart';

class OrdersHistoryProvider extends ChangeNotifier {
  final service = OrderHistoryService();
  bool isloading = false;
  OrderHistory _orderHistory = OrderHistory();
  OrderHistory get orderHistory => _orderHistory;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _orderHistory = res;

    isloading = false;
    notifyListeners();
  }
}
