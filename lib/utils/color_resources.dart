import 'package:flutter/material.dart';

class ColorResource {
  static var gradientColor = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Colors.blue,
      Colors.blueAccent,
      Colors.blueGrey,
      Colors.indigoAccent,
    ],
  );
}
