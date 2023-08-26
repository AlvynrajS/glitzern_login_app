import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzern_login_app/screens/registration_screen/registration_screen_controller.dart';
import 'package:glitzern_login_app/utils/string_resources.dart';
import 'package:glitzern_login_app/widgets/primary_button.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "/registration_screen";

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(RegistrationScreenController());
    return GetBuilder<RegistrationScreenController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 30, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 100.0)),
                    ),
                    child: const Text(
                      "Registration",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    right: MediaQuery.of(context).size.width / 2.5,
                    child: GestureDetector(
                      onTap: () {
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
                                              .getImage(ImageSource.gallery);
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
                                              .getImage(ImageSource.camera);
                                          Get.back();
                                        },
                                        child: Text(
                                          StringResource.takePhoto
                                              .toUpperCase(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                              );
                            });
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: controller.image != null
                            ? FileImage(controller.image!)
                            : null,
                        child: controller.image == null
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
                                                    await controller.getImage(
                                                        ImageSource.gallery);

                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    StringResource.choosePhoto
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  )),
                                              TextButton(
                                                  onPressed: () async {
                                                    await controller.getImage(
                                                        ImageSource.camera);

                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    StringResource.takePhoto
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ))
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(Icons.add_a_photo_outlined))
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: controller.nameController,
                        decoration: const InputDecoration(
                            label: Text(StringResource.name,
                              style: TextStyle(color: Colors.blue),),
                            hintText:
                                StringResource.enterYour + StringResource.name,
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: controller.emailIdController,
                        decoration: const InputDecoration(
                            label: Text(StringResource.email,
                              style: TextStyle(color: Colors.blue),),
                            hintText:
                                StringResource.enterYour + StringResource.email,
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: controller.phoneNumberController,
                        decoration: const InputDecoration(
                            label: Text(StringResource.phoneNumber,
                              style: TextStyle(color: Colors.blue),),
                            hintText:
                                StringResource.enterYour + StringResource.email,
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: controller.addressController,
                        decoration: const InputDecoration(
                            label: Text(StringResource.address,
                              style: TextStyle(color: Colors.blue),),
                            hintText: StringResource.enterYour +
                                StringResource.address,
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: controller.userNameController,
                        decoration: const InputDecoration(
                            label: Text(StringResource.userId,
                              style: TextStyle(color: Colors.blue),),
                            hintText: StringResource.enterYour +
                                StringResource.userId,
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                            label: Text(StringResource.password,
                              style: TextStyle(color: Colors.blue),),
                            hintText: StringResource.enterYour +
                                StringResource.password,
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                      SizedBox(height: 30),
                      PrimaryButton(
                          buttonText: StringResource.register,
                          onPressed: () {
                            controller.buttonAction(context);
                          })
                    ]),
              ),
            ],
          ),
        ),
      );
    });
  }
}
