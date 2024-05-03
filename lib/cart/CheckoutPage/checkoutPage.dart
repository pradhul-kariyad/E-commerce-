// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_import, unnecessary_brace_in_string_interps, use_build_context_synchronously, non_constant_identifier_names

import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mainproject/cart/cartPage/cartPage.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/checkOutProvider/checkOutPostProvider/checkOutPost.dart';
import 'package:mainproject/providers/checkOutProvider/checkOutProvider.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/widgets/checkOutForm/checkOutForm.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/view/widgets/profileForm/normalProfile.dart';
import 'package:mainproject/view/widgets/profileForm/profileForm.dart';
import 'package:mainproject/view/widgets/profileForm/proflieText.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _nameController = TextEditingController();
    var _addressController = TextEditingController();
    var _cityController = TextEditingController();
    var _stateController = TextEditingController();
    var _pinCodeController = TextEditingController();
    var _phonenoController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MainPage();
            }));
          },
          icon: Icon(Icons.arrow_back, color: ColorData.white),
        ),
        title: Center(
          widthFactor: 2.1.sp,
          child: Text(
            "Checkout",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorData.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
              ),
              CheckOutForm(
                obscureText: false,
                labelText: 'name',
                controller: _nameController,
                onSaved: (value) {},
                onPressed: () {},
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              CheckOutForm(
                obscureText: false,
                labelText: 'address',
                controller: _addressController,
                onSaved: (value) {},
                onPressed: () {},
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.h,
              ),

              CheckOutForm(
                obscureText: false,
                labelText: 'city',
                controller: _cityController,
                onSaved: (value) {},
                onPressed: () {},
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your city';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.h,
              ),

              CheckOutForm(
                obscureText: false,
                labelText: 'state',
                controller: _stateController,
                onSaved: (value) {},
                onPressed: () {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your state';
                  }
                  return null;
                },
                hintText: '',
              ),
              SizedBox(
                height: 1.h,
              ),

              CheckOutForm(
                obscureText: false,
                labelText: 'pincode',
                controller: _pinCodeController,
                onSaved: (value) {},
                onPressed: () {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your pincode';
                  }
                  return null;
                },
                hintText: '',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 1.h,
              ),
              CheckOutForm(
                obscureText: false,
                labelText: 'phoneno',
                controller: _phonenoController,
                onSaved: (value) {},
                onPressed: () {},
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your phoneno';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              ),
              // CheckOutForm(
              //   obscureText: false,
              //   labelText: 'Name',
              //   controller: _nameController,
              //   onSaved: (value) {},
              //   onPressed: () {},
              //   hintText: '',
              // ),
              // CheckOutForm(
              //   obscureText: false,
              //   labelText: 'Name',
              //   controller: _nameController,
              //   onSaved: (value) {},
              //   onPressed: () {},
              //   hintText: '',
              // ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                width: 55.w,
                height: 6.h,
                child: Consumer<CheckOutProvider>(
                  builder: (BuildContext context, checkOut, Widget? child) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(ColorData.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await context.read<SaveCheckOut>().saveCheckOut(
                                _nameController.text,
                                _addressController.text,
                                _cityController.text,
                                _stateController.text,
                                _pinCodeController.text,
                                _phonenoController.text,
                                context);
                          }
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: ColorData.white),
                        ));
                  },
                ),
              ),

              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
