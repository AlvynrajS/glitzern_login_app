import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  String buttonText;
  void Function()? onPressed;

  PrimaryButton({super.key, required this.buttonText, required this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: widget.onPressed,
      child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.indigo]),
            borderRadius: BorderRadius.circular(30)),
        child: Container(
          height: 60,
          width: 150,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
