import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzern_login_app/screens/dash_board_screen/dash_board_screen.dart';
import 'package:glitzern_login_app/utils/AppUtils.dart';
import 'package:glitzern_login_app/utils/shared_preference.dart';

class LoginScreenController extends GetxController with StateMixin {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> authenticateUser(String providedUsername,
      String providedPassword, BuildContext context) async {
    final loadedUser = await MySharedPreference.getUser();
    if (loadedUser != null) {
      if (loadedUser.isValidCredentials(providedUsername, providedPassword)) {
        userNameController.clear();
        passwordController.clear();
        Get.toNamed(DashBoardScreen.routeName);
      } else {
        AppUtils.alert(context, "User id or password Incorrect");
      }
    } else {
      AppUtils.alert(context, "User data not found");
    }
  }
}
