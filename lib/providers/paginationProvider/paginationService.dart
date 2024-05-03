// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import, file_names
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/models/allProductModel/all_product_model/all_product_model.dart';
import 'package:mainproject/models/productModel/post.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginationService {
  Future<AllProductModel> getAll(dynamic addPage) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('http://${ip}:3000/flutter/allproduct/$addPage'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // log('${response.body}');
    // log('${response.headers}');
    if (response.statusCode == 200) {
      log('PaginationService Successful');
      log(response.body);

      return AllProductModel.fromJson(json.decode(response.body));
    }
    return AllProductModel();
  }
}
