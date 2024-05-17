// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ImgProvider extends ChangeNotifier {
  File? _imageFile;
  bool _isLoading = false;

  File? get img => _imageFile;
  bool get isLoading => _isLoading;

  void getImage({required ImageSource source}) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) {
      return;
    }
    _imageFile = File(pickedFile.path);
    notifyListeners();
  }

  Future<void> updateImage(BuildContext context) async {
    if (_imageFile == null) {
      return;
    }

    try {
      _setLoading(true); // Set loading to true while uploading
      await editWithImg(_imageFile);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: ColorData.red,
        content: Text("Profile updated successfully..."),
      ));
    } catch (e) {
      log("Error: $e");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while updating user: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      _setLoading(false); // Set loading to false after upload is done
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}

Future<void> editWithImg(File? image) async {
  log('edit user function');
  SharedPreferences pref = await SharedPreferences.getInstance();
  final token = pref.getString('token');
  final String url = "http://${ip}:3000/flutter/edituser";

  try {
    final http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';

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
