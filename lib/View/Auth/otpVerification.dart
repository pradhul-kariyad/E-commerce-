import 'package:flutter/material.dart';
import 'package:mainproject/view/widget/ipaddress/ipaddress.dart';
// import 'package:mainproject/view/home/homePage.dart';
// import 'package:mainproject/view/auth/createPage.dart';
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/widget/myButton.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class OtpVarification extends StatelessWidget {
  const OtpVarification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 1,
        child: PinputExample(),
      ),
    );
  }
}

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class PinputExample extends StatefulWidget {
  const PinputExample({Key? key}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.5.h, left: 3.w),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      print('back button');
                    },
                    icon: Icon(Icons.arrow_back)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: Text(
                'Verify Code',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Please enter the code we just sent to email',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 209, 207, 207)),
          ),
          Text(
            'example@email.com',
            style: TextStyle(
                color: Colors.red,
                fontSize: 11.1.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 7.h,
          ),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  // Specify direction if desired
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 6,
                    controller: pinController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => const SizedBox(width: 8),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your pin';
                      }
                      return null;
                    },
                    // onClipboardFound: (value) {
                    //   debugPrint('onClipboardFound: $value');
                    //   pinController.setText(value);
                    // },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Didn't receivce OTP?",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 209, 207, 207)),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Resend code',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      fontSize: 11.sp,
                      color: Colors.black),
                ),
                // SizedBox(
                //   height: 8.h,
                // ),
                SizedBox(
                  height: 5.h,
                ),
                MyButton(
                  name: 'Verify',
                  onPressed: () {
                    verifyCode(pinController.text, context);
                    focusNode.unfocus();
                    formKey.currentState!.validate();
                  },
                ),
                // TextButton(
                //   onPressed: () {
                //     focusNode.unfocus();
                //     formKey.currentState!.validate();
                //   },
                //   child: const Text('Validate'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void verifyCode(String otp, BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      // ignore: await_only_futures
      var userid = await pref.get('userid');

      // Replace the URL with your actual endpoint
      var response = await http.post(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse('http://${ip}:3000/flutter/validate-otp'),
        body: {
          'otp': otp,
          'id': userid,
        },
      );

      if (response.statusCode == 200) {
        // Code verification successful
        debugPrint('Code verification successful');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      } else {
        // Code verification failed
        debugPrint('Code verification failed');
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Verification Failed'),
            content: Text('The entered code is incorrect.'),
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
      }
    } catch (e) {
      // Error occurred during API call
      debugPrint('Error occurred: $e');
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while verifying the code.'),
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
    }

    setState(() {
      isLoading = false;
    });
  }
}
