import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzern_login_app/screens/dash_board_screen/dash_board_screen_controller.dart';
import 'package:glitzern_login_app/screens/login_screen/login_screen.dart';
import 'package:glitzern_login_app/utils/string_resources.dart';
import 'package:glitzern_login_app/widgets/primary_button.dart';
import 'package:image_picker/image_picker.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = "/dash_board_screen";

  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(DashBoardScreenController());
    return GetBuilder<DashBoardScreenController>(builder: (controller) {
      return Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        Stack(
          children: [
            Image.asset("assets/images/top_image.jpeg"),
            Positioned(
              top: 30,
              child: Text(
                "Welcome ${controller.userData?.name ?? ""}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              top: 100,
              left: 100,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: controller.userData!.image != null
                        ? FileImage(File(controller.userData!.image ?? ""))
                        : null,
                    child: controller.userData!.image == null
                        ? IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.lightBlue,
                                      title: Column(
                                        children: [
                                          TextButton(
                                              onPressed: () async {
                                                await controller
                                                    .getImage(
                                                        ImageSource.gallery)
                                                    .then((value) => controller
                                                        .updateUser());

                                                Get.back();
                                              },
                                              child: Text(
                                                StringResource.choosePhoto
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              )),
                                          TextButton(
                                              onPressed: () async {
                                                await controller
                                                    .getImage(
                                                        ImageSource.camera)
                                                    .then((value) => controller
                                                        .updateUser());

                                                Get.back();
                                              },
                                              child: Text(
                                                StringResource.takePhoto
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ))
                                        ],
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              size: 50,
                            ))
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        customListTile(
          Icons.person,
          controller.userData?.name ?? "Null",
        ),
        SizedBox(height: 30),
        customListTile(
          Icons.email,
          controller.userData?.email ?? "Null",
        ),
        SizedBox(height: 30),
        customListTile(
          Icons.phone,
          controller.userData?.phone ?? "Null",
        ),
        SizedBox(height: 30),
        customListTile(
          Icons.location_on_outlined,
          controller.userData?.address ?? "Null",
        ),
        SizedBox(height: 30),
        PrimaryButton(
            buttonText: StringResource.logOut,
            onPressed: () {
              Get.offAndToNamed(LogInScreen.routeName);
            })
      ])));
    });
  }

  Widget customListTile(IconData iconData, String text) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 40,
        color: Colors.blue,
      ),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }
}
