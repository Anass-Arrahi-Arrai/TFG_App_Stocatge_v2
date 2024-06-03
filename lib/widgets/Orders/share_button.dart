

import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final IconData icon;
  final String text;
  VoidCallback onPressed;
  ShareButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          child: MaterialButton(
            onPressed: onPressed,
            textColor: Colors.white,                
            color:Colors.brown,
            shape: CircleBorder(),
            child: Icon(
              size: 45,
              icon
            )
          ),
        ),
        Text(
              text,
              textAlign: TextAlign.center,
              ),
      ],
    );
  }
}
