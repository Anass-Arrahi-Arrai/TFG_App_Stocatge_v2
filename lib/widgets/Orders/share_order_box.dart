

import 'package:app_stocatge/models/order.dart';
import 'package:app_stocatge/repositories/supplier_repository.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'share_button.dart';


class ShareOrderBox extends StatefulWidget {
  final Order order;
  final SupplierRepository sR = SupplierRepository();
  ShareOrderBox({super.key, required this.order});

  @override
  State<ShareOrderBox> createState() => _ShareOrderBoxState();
}

class _ShareOrderBoxState extends State<ShareOrderBox> {


  void shareOrder(String method) async {
    String orderDetails = generateOrderDetails(widget.order);
    String mail=widget.sR.getSupplierByName(widget.order.supplierName).email ?? "";
    if (method == 'email') {
      final mailtoLink = Mailto(
        to: [mail],
        subject: 'New Order by (Name of Business)',
        body: orderDetails,
      );
      await launchUrl(Uri.parse(mailtoLink.toString()));
    } 
    else{
      Share.share(orderDetails);
    } 
  }

  String generateOrderDetails(Order order) {
    
    return order.toString();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Send\n${widget.order.supplierName}\nOrder Via", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
        ),
      insetPadding: const EdgeInsets.only(top:80, bottom: 40),
      iconPadding: EdgeInsets.only(top:10),
      icon: Icon(Icons.send, size: 60, color: Colors.brown[800]),
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                ShareButton(
                  icon: Icons.mail,
                  text: "E-Mail",
                  onPressed: ()=>shareOrder('email'),
                ),
                SizedBox(width: 10,),
                ShareButton(
                  icon: Icons.send_to_mobile,
                  text: "Other",
                  onPressed: ()=>shareOrder(''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
