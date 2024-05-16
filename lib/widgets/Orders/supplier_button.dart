import "package:flutter/material.dart";

// ignore: must_be_immutable
class SupplierButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  SupplierButton({super.key, required this.text, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
      child: MaterialButton(
        splashColor: Colors.brown[200],
        onPressed: onPressed,
        textColor: Colors.white,
        color: Colors.brown[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 40,
          child: Center(
            child: Text(
              text,  // Display the supplier name dynamically
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
          ),
        ),
      ),
    );
  }
}