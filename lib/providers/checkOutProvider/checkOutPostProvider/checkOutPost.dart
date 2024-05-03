// ignore_for_file: unnecessary_brace_in_string_interps, use_build_context_synchronously, non_constant_identifier_names, file_names, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mainproject/cart/cartPage/cartPage.dart';
import 'package:mainproject/cart/razorpay/paymentPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/models/orderModel/order_model/orderModel.dart';
import 'package:mainproject/providers/orderCreationProvider/orderCreation.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveCheckOut extends ChangeNotifier {
  Future<void> saveCheckOut(
      String Name,
      String address,
      String city,
      String state,
      String pincode,
      String phoneno,
      BuildContext context) async {
    log("Sending update request...");
    log("name: $Name ");
    log("address: $address");
    log("city: $city");
    log("state: $state");
    log("pincode: $pincode");
    log("phoneno: $phoneno");

    // try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token'); // Removed 'await' here
    if (token == null) {
      throw Exception('Token not found');
    }

    var response = await http.post(
      Uri.parse('http://${ip}:3000/flutter/placeorder'),
      body: {
        'name': Name,
        'address': address,
        'city': city,
        'state': state,
        'pincode': pincode,
        'phoneno': phoneno,
        'paymentMethod': "razorpay",
      },
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    log('Response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var orderModel = OrderModel.fromJson(jsonData);
      log(response.body);

      Provider.of<OrderCreationProvider>(context, listen: false)
          .setOrderCreation(orderModel);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return PaymentPage();
      }));
    } else {
      throw Exception(
          'Failed to update user. Status code: ${response.statusCode}');
    }
    // }
    // catch (e) {
    //   log("Error: $e");
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Error'),
    //       content: Text('An error occurred while updating user: $e'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }
}
