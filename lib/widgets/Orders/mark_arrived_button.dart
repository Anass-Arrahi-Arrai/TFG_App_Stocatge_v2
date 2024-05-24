// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarkArrivedButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  VoidCallback onPressed;

  MarkArrivedButton({super.key, required this.text, required this.onPressed, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    
    return Opacity(
      opacity: isEnabled ? 1: 0.4,
      child: Container(
        height: 70,
        child: MaterialButton(
          shape:  CircleBorder(),
          onPressed: isEnabled ? onPressed : null,
          textColor: Colors.white,
          color:Colors.green,
          disabledColor: Colors.grey[800],
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
            ),
            ),
        ),
      ),
    );
  }
}