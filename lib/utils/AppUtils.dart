import 'package:flutter/material.dart';

class AppUtils{

  static Future alert(BuildContext context, String errorString) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.lightBlue, title: Text(errorString));
        });
  }
}