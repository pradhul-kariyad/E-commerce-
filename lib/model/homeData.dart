// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mainproject/commonWidget/ipaddress.dart';
import 'package:mainproject/model/categorizedProducts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<CategorizedProducts> homeData() async {
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('http://${ip}:3000/flutter/fhome'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log('${response.body}');
    log('${response.headers}');
    if (response.statusCode == 200) {
      log('successful');
      return CategorizedProducts.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  } catch (e) {
    log('Error$e');

    throw Exception("");
  }
}
