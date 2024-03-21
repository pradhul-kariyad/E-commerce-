// import 'package:flutter/foundation.dart';
// import 'package:textingslap/pages/chatPage.dart';

import 'package:flutter/material.dart';
import 'package:mainproject/view/auth/createPage.dart';
import 'package:mainproject/view/auth/signInPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignInPage(
        onTap: togglePages,
      );
    } else {
      return CreatePage(
        onTap: togglePages,
      );
    }
  }
}
