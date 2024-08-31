// ignore_for_file: unused_import
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/providers/profileProvider/imgProvider/imgProvider.dart';
import 'package:mainproject/providers/profileProvider/profileProvider.dart';
import 'package:mainproject/view/pages/profile/profilePage.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/view/widgets/profileForm/profileButton.dart';
import 'package:mainproject/view/widgets/profileForm/profileForm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: ColorData.red,
        title: Center(
          widthFactor: 1.8.sp,
          child: Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: ColorData.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ProfileProvider>(
          builder: (BuildContext context, profile, Widget? child) {
            if (profile.isloading) {
              return Padding(
                padding: EdgeInsets.only(top: 38.h),
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorData.grey,
                  ),
                ),
              );
            }
            var name = profile.data.data!.name;
            var phn = profile.data.data!.phoneno;
            TextEditingController _nameController =
                TextEditingController(text: name);
            TextEditingController _phnController =
                TextEditingController(text: phn.toString());
            return Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(
                  height: 5.h,
                ),
                Center(
                    child: Stack(
                  children: [
                    Consumer<ImgProvider>(
                      builder:
                          (BuildContext context, imgProvider, Widget? child) {
                        if (imgProvider.isLoading) {
                          return CircularProgressIndicator(
                            strokeAlign: -5,
                            color: ColorData.grey,
                          );
                        }
                        return imgProvider.img != null
                            ? CircleAvatar(
                                backgroundImage: FileImage(imgProvider.img!),
                                radius: 50.sp,
                              )
                            : CircleAvatar(
                                backgroundColor: ColorData.white,
                                backgroundImage:
                                    AssetImage('assets/images/profileImg.PNG'),
                                radius: 50.sp,
                              );
                      },
                    ),
                    Positioned(
                        top: 11.h,
                        left: 24.w,
                        child: CircleAvatar(
                          radius: 14.sp,
                          backgroundColor: ColorData.red,
                          child: IconButton(
                              onPressed: () {
                                showImagePickerOption(context);
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 15.sp,
                                color: ColorData.white,
                              )),
                        )),
                  ],
                )),
                ProfileForm(
                  name: "Name",
                  controller: _nameController,
                  onSaved: (value) {},
                  icon: (Icons.edit_note_sharp),
                  obscureText: false,
                  onPressed: () {},
                  hintText: "",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                ProfileForm(
                  name: "Phone Number",
                  controller: _phnController,
                  onSaved: (value) {},
                  icon: (Icons.edit_note_sharp),
                  obscureText: false,
                  onPressed: () {},
                  hintText: '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                ProfileButton(
                  name: "Update",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      update(
                          _nameController.text, _phnController.text, context);
                    }
                  },
                ),
              ]),
            );
          },
        ),
      ),
    );
  }

  Future<void> update(String name, String phoneno, BuildContext context) async {
    log("Sending update request...");
    log("Name: $name");
    log("Phone Number: $phoneno");

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      if (token == null) {
        throw Exception('Token not found');
      }

      var response = await http.post(
        Uri.parse('http://${ip}:3000/flutter/edituser'),
        body: {'name': name, 'phoneno': phoneno},
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        log("Update successful");
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) {
        //   return ProfilePage();
        // }));

        // Update the profile image if any image was selected
        var imgProvider = Provider.of<ImgProvider>(context, listen: false);
        if (imgProvider.img != null) {
          await imgProvider.updateImage(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.red,
            content: Text("Profile updated successfully..."),
          ));
        }
      } else {
        throw Exception(
            'Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log("Error: $e");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while updating user: $e'),
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
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white10,
        context: context,
        builder: (builder) {
          return Consumer<ImgProvider>(
            builder: (BuildContext context, img, Widget? child) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp))),
                height: 14.h,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          img.getImage(source: ImageSource.gallery);
                          if (img.img != null) {
                            await img.updateImage(context);
                          }
                        },
                        child: SizedBox(
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    img.getImage(source: ImageSource.gallery);
                                    if (img.img != null) {
                                      await img.updateImage(context);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.image,
                                  )),
                              Text("Gallery")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          img.getImage(source: ImageSource.camera);
                          if (img.img != null) {
                            await img.updateImage(context);
                          }
                        },
                        child: SizedBox(
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    img.getImage(source: ImageSource.camera);
                                    if (img.img != null) {
                                      await img.updateImage(context);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                  )),
                              Text("Camera"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
