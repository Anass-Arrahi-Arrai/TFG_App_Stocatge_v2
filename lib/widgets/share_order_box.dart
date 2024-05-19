// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:app_stocatge/models/order.dart';
import 'package:app_stocatge/widgets/my_button.dart';
import 'package:flutter/material.dart';

import 'share_button.dart';
import 'share_button.dart';


class ShareOrderBox extends StatefulWidget {
  final Order order;
  const ShareOrderBox({super.key, required this.order});

  @override
  State<ShareOrderBox> createState() => _ShareOrderBoxState();
}

class _ShareOrderBoxState extends State<ShareOrderBox> {
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Send Order Via", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
        ),
      insetPadding: const EdgeInsets.only(top:80, bottom: 40),
      contentPadding: const EdgeInsets.all(10),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.shopping_bag, size: 60, color: Colors.brown[800]),
      backgroundColor: Colors.brown[200],
      content: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.brown,
                          width: 2.0,
                        ),
                      ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShareButton(
                  icon: Icons.chat,
                  text: "Whats App",
                  onPressed: (){},
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShareButton(
                  icon: Icons.mail,
                  text: "E-Mail",
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
