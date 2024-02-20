import 'package:flutter/material.dart';
import 'package:mainproject/CommonWidget/containerButton.dart';
import 'package:mainproject/CommonWidget/TextForm.dart';
import 'package:mainproject/CommonWidget/checkBox.dart';
import 'package:mainproject/CommonWidget/dividerUp.dart';
import 'package:mainproject/View/Home/homePage.dart';
import 'package:mainproject/View/SplashScreen/SplashScreen1.dart';
// import 'package:mainproject/View/homePage.dart';
import 'package:sizer/sizer.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 9.h),
              child: Center(
                child: Text(
                  'Create Account',
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
              'Fill your information below or register',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            Text(
              'with your social account.',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 209, 207, 207)),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextForm(name: 'Name'),
            TextForm(name: 'Email'),
            TextForm(name: 'Password', icon: Icons.remove_red_eye_outlined),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: EdgeInsets.only(top: 3.2.h, left: 2.2.h),
              child: Row(
                children: [
                  Checkboxx(),
                  Text(
                    'Agree with ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 11.1.sp),
                  ),
                  Text(
                    "Terms&Condition",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 11.1.sp,
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
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 2.4.h,
                  backgroundImage: AssetImage('assets/images/GoogleImg.PNG'),
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/images/fb.PNG'),
                // ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  style:
                      //  Theme.of(context)
                      //     .textTheme
                      //     .displaySmall
                      //     ?.copyWith(color: const Color.fromARGB(66, 158, 120, 120))
                      TextStyle(fontSize: 1.6.h, fontWeight: FontWeight.bold),
                  "Already have an account? ",
                ),
                Text(
                  "Sign in",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontSize: 1.6.h,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
