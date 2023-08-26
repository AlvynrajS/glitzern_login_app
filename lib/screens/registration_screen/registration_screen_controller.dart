import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzern_login_app/model/user.dart';
import 'package:glitzern_login_app/screens/login_screen/login_screen.dart';
import 'package:glitzern_login_app/utils/AppUtils.dart';
import 'package:glitzern_login_app/utils/shared_preference.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreenController extends GetxController with StateMixin {
  File? image;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future getImage(ImageSource source) async {
    File? imageFile;
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      change(image = imageFile);
    }
    return image;
  }

  Future buttonAction(context) async {
    final user = User(
      name: nameController.text,
      email: emailIdController.text,
      phone: phoneNumberController.text,
      address: addressController.text,
      userId: userNameController.text,
      password: passwordController.text,
      image: image?.path,
    );
    if (userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        emailIdController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        userNameController.text.isNotEmpty) {
      await MySharedPreference.saveUser(user).then((value) {
        userNameController.clear();
        phoneNumberController.clear();
        emailIdController.clear();
        addressController.clear();
        passwordController.clear();
        userNameController.clear();
        Get.toNamed(LogInScreen.routeName);
      });
    } else {
      AppUtils.alert(context, "All filed are mandatory");
    }
  }
}
