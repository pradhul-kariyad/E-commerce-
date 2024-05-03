// ignore_for_file: await_only_futures, unnecessary_brace_in_string_interps, annotate_overrides, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/models/profileModel/profile_data/data.dart';
import 'package:mainproject/models/profileModel/profile_data/profile_data.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<ProfileData> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('http://${ip}:3000/flutter/profile'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      log(response.body);
      log('successful');

      return ProfileData.fromJson(json.decode(response.body));
    }
    return ProfileData();
  }

  // notifyListeners();
}
