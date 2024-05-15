// ignore_for_file: avoid_print, unused_field, unused_import, prefer_final_fields, must_be_immutable, use_build_context_synchronously, unnecessary_brace_in_string_interps, await_only_futures, no_leading_underscores_for_local_identifiers, non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:mainproject/models/profileModel/profile_data/profile_data.dart';
import 'package:mainproject/providers/profileProvider/imgProvider/imgProvider.dart';
import 'package:mainproject/providers/profileProvider/profileProvider.dart';
import 'package:mainproject/providers/profileProvider/proflieUpdate/profileUpdate.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/home/profile/profilePage.dart';
import 'package:mainproject/view/home/profile/yourProfile.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:mainproject/view/widgets/myButton.dart';
import 'package:mainproject/view/widgets/profileForm/profileButton.dart';
import 'package:mainproject/view/widgets/profileForm/profileForm.dart';
import 'package:mainproject/view/widgets/textForm/nameForm.dart';
import 'package:mainproject/view/widgets/textForm/passwordForm.dart';
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
  // File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: ColorData.red,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return MainPage();
        //       }));
        //     },
        //     icon: Icon(Icons.arrow_back, color: ColorData.white)),
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
                    // Update the CircleAvatar to conditionally show the selected image
                    Consumer<ImgProvider>(
                      builder:
                          (BuildContext context, imgProvider, Widget? child) {
                        if (imgProvider.isLoading) {
                          return CircularProgressIndicator();
                        }
                        return imgProvider.img != null
                            ? CircleAvatar(
                                backgroundImage: FileImage(imgProvider.img!),
                                radius: 50.sp,
                              )
                            : CircleAvatar(
                                backgroundColor: ColorData.grey,
                                child: Icon(
                                  Icons.person_outline_sharp,
                                  color: ColorData.black,
                                  size: 50.sp,
                                ),
                                radius: 50.sp,
                              );
                      },
                    ),

                    // if (imageFile != null)
                    //   CircleAvatar(
                    //     backgroundImage: FileImage(imageFile!),
                    //     radius: 50.sp,
                    //   ),
                    // CircleAvatar(
                    //   backgroundImage: AssetImage("assets/images/hoodie.PNG"),
                    //   radius: 50.sp,
                    // ),
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

  //
  Future<void> update(String name, String phoneno, BuildContext context) async {
    log("Sending update request...");
    log("Name: $name");
    log("Phone Number: $phoneno");

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token'); // Removed 'await' here
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorData.red,
            content: Text("Profile updated successfully...")));
        // Show success dialog or navigate to the HomePage
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
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height / 4,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          img.getImage(source: ImageSource.gallery);
                          if (img.img != null) {
                            await img.updateImage(context);
                          }
                          // context
                          //     .read<ImgProvider>()
                          //     .getImage(source: ImageSource.camera);
                          // _pickImageFromGallery();
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
                                    // context
                                    //     .read<ImgProvider>()
                                    //     .getImage(source: ImageSource.gallery);
                                  },
                                  icon: Icon(
                                    Icons.image,
                                    // size: 70,
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
                          // context
                          //     .read<ImgProvider>()
                          //     .getImage(source: ImageSource.camera);
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
                                    // context
                                    //     .read<ImgProvider>()
                                    //     .getImage(source: ImageSource.camera);
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    // size: 70,
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
