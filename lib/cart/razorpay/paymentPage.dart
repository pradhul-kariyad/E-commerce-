// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'dart:developer';
// import 'package:fashion_world/ip.dart';

import 'package:flutter/material.dart';
import 'package:mainproject/cart/razorpay/verifyPayment.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/cartProvider/cartDataProvider/cartDataProvider.dart';
import 'package:mainproject/providers/checkOutProvider/verifyPaymentProvider/verifyPaymentProvider.dart';
import 'package:mainproject/providers/orderCreationProvider/orderCreation.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<OrderCreationProvider>();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 46.h, bottom: 2.h),
            child: Consumer<CartDataProvider>(
              builder: (BuildContext context, cart, Widget? child) {
                return Text(
                  ' Total Price : ${cart.cartModel.total} ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: ColorData.black),
                );
              },
            ),
          ),
          Center(
            child: Consumer<OrderCreationProvider>(
              builder: (BuildContext context, orderProvider, Widget? child) {
                var orderModel = orderProvider.orderCreation;
                if (orderModel != null) {
                  var amount = orderModel.order?.amount;
                  var orderId = orderModel.order?.id;
                  var state = orderModel.order?.receipt;
                  log('amount: $amount');
                  log('id: $orderId');
                  log('receipt:$state');
                  log('Order created: $orderModel');

                  if (orderProvider.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        log("Razorpay payment initiated");

                        // Configure Razorpay options
                        var options = {
                          'key': 'rzp_test_pJw1K1QJDp192x',
                          'amount': amount,
                          'name': 'Acme Corp.',
                          'order_id': "$orderId",
                          'description': 'Fine T-Shirt',
                          'prefill': {
                            'contact': '8888888888',
                            'email': 'rasir239@gmail.com',
                          }
                        };

                        Razorpay razorpay = Razorpay();
                        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                            handlePaymentErrorResponse);
                        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                            handlePaymentSuccessResponse);
                        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                            handleExternalWalletSelected);
                        razorpay.open(options);

                        // if (razorpay == 200) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => VerifyPayment()));
                        // }
                      },
                      child: Container(
                        height: 5.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: ColorData.red,
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Center(
                          child: Text(
                            'Pay Now',
                            style: TextStyle(
                                fontSize: 9.sp, color: ColorData.white),
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: Text('Order is null!....'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */

    var orderId = response.orderId!;
    var paymentId = response.paymentId!;
    var signature = response.signature!;
    var state =
        context.read<OrderCreationProvider>().orderCreation?.order?.receipt;

    Provider.of<VerifyPaymentProvider>(context, listen: false).verifyPayment(
      paymentId,
      orderId,
      signature,
      state!,
      context,
    );
    

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => VerifyPayment()),
    );
    log(response.data.toString());
    // showAlertDialog(
    //     context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  // Function to verify payment
}
