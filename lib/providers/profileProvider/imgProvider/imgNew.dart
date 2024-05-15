import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> editWithImg(
  File? image,
) async {
  log('edit user function');
  SharedPreferences pref = await SharedPreferences.getInstance();
  final token = pref.getString('token');
  final String url = "http://${ip}:3000/flutter/edituser";

  try {
    final http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';

    // Add name and phone fields to request
    // request.fields['name'] = name;
    // request.fields['phoneno'] = phone;

    // Add image file to request if available
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
    }

    final http.StreamedResponse response = await request.send();
    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      log('Edit operation successful: $responseBody');
    } else {
      final responseBody = await response.stream.bytesToString();
      log('Edit operation failed with status code: $statusCode, response: $responseBody');
    }
  } catch (e) {
    log('Exception: $e');
  }
}
