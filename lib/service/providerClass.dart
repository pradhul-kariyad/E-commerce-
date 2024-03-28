// ignore_for_file: file_names,unnecessary_brace_in_string_interps,unused_local_variable, unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mainproject/models/homeData.dart';
import 'package:mainproject/models/postmodel.dart';
import 'package:mainproject/view/widget/ipaddress/ipaddress.dart';

class ProviderClass  {
  getAll() async {
    var url = 'http://${ip}:3000/flutter/fhome';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
     
    }
  }

}
