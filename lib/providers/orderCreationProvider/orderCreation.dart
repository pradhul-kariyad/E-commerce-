// ignore_for_file: prefer_final_fields, unused_import, file_names
import 'package:flutter/material.dart';
import 'package:mainproject/models/orderModel/order_model/orderModel.dart';

class OrderCreationProvider extends ChangeNotifier {
  OrderModel? _orderCreation;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  OrderModel? get orderCreation => _orderCreation;

  void setOrderCreation(OrderModel orderCreation) {
    _orderCreation = orderCreation;
    notifyListeners();
  }
}
