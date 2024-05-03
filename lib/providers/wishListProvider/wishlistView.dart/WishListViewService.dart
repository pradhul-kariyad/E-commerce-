// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/models/bannerModel/banner_model/bannerModel.dart';
import 'package:mainproject/models/cartModel/cart_model/cart_model.dart';
import 'package:mainproject/models/cartModel/cart_model/item.dart';
import 'package:mainproject/models/productModel/post.dart';
import 'package:mainproject/models/wishListModel/wish_list_model/wish_list_model.dart';
import 'package:mainproject/providers/wishListProvider/wishListDataProvider/wishListDataProvider.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/models/examples/categorizedProducts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListViewService {
  Future<void> getAll(dynamic id, BuildContext context) async {
    try {
      log(id);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final token = preferences.get('token');
      var response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/wishlist/${id}'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        log('Response body: ${response.body}');
        log('Response status code: ${response.statusCode}');
      } else {
        log("errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      }
    } catch (e) {
      log('Error : $e');
    }
  }
}
