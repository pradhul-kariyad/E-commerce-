// import 'dart:math';

// ignore_for_file: await_only_futures, unnecessary_brace_in_string_interps

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/models/productModel/post.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ExampleProvider with ChangeNotifier {
  Post? _homeData;
  bool _isLoading = false;
  Post? get homeData => _homeData;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = await pref.getString('token');
      log('${token}');
      // Make the API call to fetch data
      final response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/fhome'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log('Response Status Code: ${response.statusCode}');
// log('Response Body: ${response.body}');

      // Check if the response is successful
      if (response.statusCode == 200) {
        log('sdfghjjjjjj');
        // Parse the response data into your model classes

        final jsonData = json.decode(response.body);
        if (jsonData != null && jsonData is Map<String, dynamic>) {
          log(jsonData.toString());

          _homeData = Post.fromJson(json.decode(response.body));

          notifyListeners();
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
