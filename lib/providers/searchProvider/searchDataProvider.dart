// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings, file_names
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/bannerModel/banner_model/bannerModel.dart';
import 'package:mainproject/models/searchModel/search_model/searchModel.dart';
import 'package:mainproject/providers/bannerProvider/bannerService.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';
import 'package:mainproject/providers/searchProvider/SearchService.dart';

class SearchDataProvider extends ChangeNotifier {
  final service = SearchService();
  bool isloading = false;
  SearchModel _searchModel = SearchModel();
  SearchModel get searchModel => _searchModel;
  Future<void> getAllPosts(search, {required bool refresh}) async {
    try {
      isloading = true;
      notifyListeners();
      final res = await service.getAll(search);
      _searchModel = res;
      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
      log("Error fetching search data");
    }

    isloading = true;
    notifyListeners();
    final res = await service.getAll(search);
    _searchModel = res;

    isloading = false;
    notifyListeners();
  }
}
