// ignore_for_file: unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/view/auth/signInPage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CircularProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(BuildContext context) {
    log('Start Page');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SignInPage();
    }));
    _isLoading = true;
    notifyListeners();
  }
}

//
// calling methord
//

// void verifyCode(String otp, BuildContext context) async {
//   final verifyProvider = Provider.of<CircularProvider>(context, listen: false);
//   verifyProvider.setLoading(true, context);

//   try {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     var userid = await pref.getString('userid');

//     // Replace the URL with your actual endpoint
//     var response = await http.post(
//       Uri.parse('http://${ip}:3000/flutter/validate-otp'),
//       body: {
//         'otp': otp,
//         'id': userid,
//       },
//     );

//     if (response.statusCode == 200) {
//       // Code verification successful
//       debugPrint('Code verification successful');
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => SignInPage()),
//       // );
//     } else {
//       // Code verification failed
//       debugPrint('Code verification failed');
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Verification Failed'),
//           content: Text('The entered code is incorrect.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   } catch (e) {
//     log(e.toString());
//     // Error occurred during API call
//     debugPrint('Error occurred: $e');
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error'),
//         content: Text('An error occurred while verifying the code.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('OK', style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   verifyProvider.setLoading(false, context);
// }
