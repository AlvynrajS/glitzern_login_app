import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzern_login_app/router.dart';
import 'package:glitzern_login_app/screens/login_screen/login_screen.dart';
import 'package:glitzern_login_app/utils/color_resources.dart';
import 'package:glitzern_login_app/utils/string_resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(LogInScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: ColorResource.gradientColor,
          ),
          child: const Center(
            child: Text(
              StringResource.welcome,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 45,
                  color: Colors.white),
            ),
          )),
    );
  }
}
