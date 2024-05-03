// ignore_for_file: unnecessary_brace_in_string_interps, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mainproject/providers/cartProvider/cartDataProvider/cartDataProvider.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class QuantityAddService {
  Future<void> getAll(dynamic id, BuildContext context) async {
    try {
      log(id);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      final token = preferences.get('token');
      var response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/cart/quantityadd/${id}'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        log('Response body: ${response.body}');
        log('Response status code: ${response.statusCode}');
        context.read<CartDataProvider>().getAllPosts();
      } else {
        log("Error");
      }
      if (response.statusCode == 400) {
        log("Error");
      }
    } catch (e) {
      log('Error : $e');
    }
  }
}
