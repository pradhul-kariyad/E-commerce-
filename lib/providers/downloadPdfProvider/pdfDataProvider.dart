// // ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:mainproject/models/productModel/post.dart';
// import 'package:mainproject/providers/downloadPdfProvider/pdfService.dart';
// import 'package:mainproject/providers/homeProvider/homeService.dart';
// import 'package:mainproject/models/examples/categorizedProducts.dart';

// class PDFDataProvider extends ChangeNotifier {
//   final service = InvoiceDownloadProvider();
//   bool isloading = false;
//   Post _categorizedProducts = Post();
//   Post get categorizedProducts => _categorizedProducts;
//   getAllPosts(id) async {
//     isloading = true;
//     notifyListeners();
//     final res = await service.getAll(id);
//     _categorizedProducts = res;
//     isloading = false;
//     notifyListeners();
//   }
// }
