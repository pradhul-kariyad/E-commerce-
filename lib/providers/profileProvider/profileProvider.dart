// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/models/profileModel/profile_data/data.dart';
import 'package:mainproject/models/profileModel/profile_data/profile_data.dart';
import 'package:mainproject/providers/homeProvider/homeService.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';
import 'package:mainproject/providers/profileProvider/profileService.dart';

class ProfileProvider extends ChangeNotifier {
  final service = ProfileService();
  bool isloading = false;
  ProfileData _data = ProfileData();
  ProfileData get data => _data;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _data = res;

    log(data.data?.email ?? "".toString() + "-----------------------......");
    isloading = false;
    log(isloading.toString() + "--------------");
    notifyListeners();
  }
}
