// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  CircleButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: MaterialButton(
        onPressed: onPressed,
        textColor: Colors.white,
        color: Colors.brown,
        shape: CircleBorder(),
        child: Center(child: Text(text)),
      ),
    );
  }
}