import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glitzern_login_app/screens/login_screen/login_screen_controller.dart';
import 'package:glitzern_login_app/screens/registration_screen/registration_screen.dart';
import 'package:glitzern_login_app/utils/string_resources.dart';
import 'package:glitzern_login_app/utils/validator.dart';
import 'package:glitzern_login_app/widgets/primary_button.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = '/login_screen';

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());
    return GetBuilder<LoginScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/login_imagesvg.svg",
                      ),
                      const Positioned(
                        top: 60,
                        left: 20,
                        child: Text(
                          StringResource.login,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.userNameController,
                      validator: (val) {
                        Validator.requiredValidator(val!);
                      },
                      decoration: const InputDecoration(
                          label: Text(
                            StringResource.userId,
                            style: TextStyle(color: Colors.white),
                          ),
                          hintText:
                              StringResource.enterYour + StringResource.userId,
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.passwordController,
                      validator: (val) {
                        Validator.requiredValidator(val!);
                      },
                      decoration: const InputDecoration(
                          label: Text(
                            StringResource.password,
                            style: TextStyle(color: Colors.white),
                          ),
                          hintText: StringResource.enterYour +
                              StringResource.password,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  SizedBox(height: 30),
                  PrimaryButton(
                      buttonText: StringResource.login,
                      onPressed: () async {
                        await controller.authenticateUser(
                            controller.userNameController.text,
                            controller.passwordController.text,
                            context);
                      }),
                  SizedBox(height: 30),
                  PrimaryButton(
                      buttonText: StringResource.register,
                      onPressed: () {
                        Get.toNamed(RegistrationScreen.routeName);
                      }),
                ],
              ),
            )),
      );
    });
  }
}
