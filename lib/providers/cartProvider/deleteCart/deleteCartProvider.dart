// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mainproject/providers/cartProvider/deleteCart/deleteCartService.dart';

class DeleteCartProvider extends ChangeNotifier {
  final service = DeleteCartService();
  // bool isloading = false;

  delete(id, context) async {
    // isloading = true;
    // notifyListeners();
    await service.getAll(id, context);
    // isloading = false;
    notifyListeners();
  }
}
