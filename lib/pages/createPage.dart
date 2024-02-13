import 'package:flutter/material.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:mainproject/commonWidget/TextForm.dart';
import 'package:mainproject/commonWidget/checkBox.dart';
import 'package:mainproject/commonWidget/dividerUp.dart';
import 'package:mainproject/pages/homePage.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Fill your information below or register',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            Text(
              'with your social account.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            SizedBox(
              height: 30,
            ),
            TextForm(name: 'Name'),
            TextForm(name: 'Email'),
            TextForm(name: 'Password', icon: Icons.remove_red_eye_outlined),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 13),
              child: Row(
                children: [
                  Checkboxx(),
                  Text(
                    'Agree with ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Text(
                    "Terms&Condition",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: GestureDetector(
                  onTap: () {
                    print('SIGN UP PAGE');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: ContainerButton(name: 'Sign Up')),
            ),
            DividerUp(name: 'Or sign up with'),
          ],
        ),
      ),
    );
  }
}
