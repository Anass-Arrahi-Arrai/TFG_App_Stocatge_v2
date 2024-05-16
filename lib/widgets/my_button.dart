// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  VoidCallback onPressed;

  MyButton({super.key, required this.text, required this.onPressed, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1: 0.4,
      child: MaterialButton(
        onPressed: isEnabled ? onPressed : null,
        textColor: Colors.white,
        color:Colors.brown,
        child: Text(text),
        disabledColor: Colors.grey[800],
      ),
    );
  }
}