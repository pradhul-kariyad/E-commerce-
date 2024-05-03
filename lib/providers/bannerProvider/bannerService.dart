// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/models/bannerModel/banner_model/bannerModel.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BannerService {
  Future<BannerModel> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('http://${ip}:3000/flutter/banner'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // log('${response.body}');
    // log('${response.headers}');
    if (response.statusCode == 200) {
      log('BannerService Successful');
      // log('${response.body}');

      return BannerModel.fromJson(json.decode(response.body));
    }
    return BannerModel();
  }
}
