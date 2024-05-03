// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/bannerModel/banner_model/bannerModel.dart';
import 'package:mainproject/providers/bannerProvider/bannerService.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';

class BannerDataProvider extends ChangeNotifier {
  final service = BannerService();
  bool isloading = false;
  BannerModel _bannerModel = BannerModel();
  BannerModel get bannerModel => _bannerModel;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _bannerModel = res;

    isloading = false;
    notifyListeners();
  }
}
