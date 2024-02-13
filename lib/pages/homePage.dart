import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mainproject/commonWidget/containerButton.dart';
import 'package:mainproject/pages/createPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: Container(
                      child: Column(
                        children: [
                          firstRow('assets/images/cameraa2.PNG'),
                          firstRow('assets/images/iphone123.PNG'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, bottom: 10),
                    child: Container(
                      child: Column(
                        children: [
                          secondRow('assets/images/hoodie.PNG', 145, 226),
                          secondRow('assets/images/iwatch.PNG', 90, 120),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 140, left: 10, bottom: 10),
                    child: Container(
                      child: Column(
                        children: [
                          thirdRow('assets/images/water bottle.PNG'),
                          thirdRow('assets/images/headSet.PNG'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Shopping ",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "Destination",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            Text('for Everything',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GestureDetector(
                onTap: () {
                  print('Start Page');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CreatePage();
                  }));
                },
                child: ContainerButton(
                  name: "Let's Get Started",
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Let's Get Started"),
            //   style: ElevatedButton.styleFrom(

            //     backgroundColor: (Colors.red)),
            // ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?  ',
                  style:
                      //  Theme.of(context)
                      //     .textTheme
                      //     .displaySmall
                      //     ?.copyWith(color: const Color.fromARGB(66, 158, 120, 120))
                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    print("Sign In");
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding thirdRow(String img) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
        width: 90,
        height: 130,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Padding secondRow(String img, double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: width, //130,
        height: height, //170,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Padding firstRow(String img) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Container(
        width: 90,
        height: 130,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img)),
            // color: Color.fromARGB(255, 195, 210, 218).withOpacity(.4),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
