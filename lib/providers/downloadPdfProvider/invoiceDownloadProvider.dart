// ignore_for_file: unnecessary_brace_in_string_interps, unused_import
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:path_provider/path_provider.dart'; // Import the path_provider package
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class InvoiceDownloadProvider extends ChangeNotifier {
  Future<void> addOrderID(dynamic orderID) async {
    log('InvoiceDownload : $orderID');
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    if (token == null) {
      log('Token not found');
      return; // Return early if token is null
    }

    try {
      // Initialize the path provider package

      final response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/pdfController/${orderID}'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        log('InvoiceDownload Successful');

        // Get the directory for storing PDF files
        final directory = await getExternalStorageDirectory();
        final filePath = '${directory?.path}/${orderID}.pdf';
        log(response.body);

        // Write PDF content to the file
        File pdfFile = File(filePath);
        await pdfFile.writeAsBytes(response.bodyBytes);

        log('PDF saved at: $filePath');
      } else {
        // Handle unsuccessful response
        log('InvoiceDownload Failed with status code: ${response.statusCode}');
        log(response.body);
      }
    } catch (error) {
      log('InvoiceDownload Error: $error');
    }
  }
}
