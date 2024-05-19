// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:app_stocatge/widgets/Orders/mark_arrived_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/order.dart';


class OrderTile extends StatefulWidget { 

  final Order order;
  
  OrderTile({
    super.key, 
    required this.order,
  });

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  //Update orders

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.brown[100],
            borderRadius: BorderRadius.circular(10),
          ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Date: \n${widget.order.getDate()}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Order to:\n ${widget.order.getSupplier()}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  
                  child: MarkArrivedButton(
                    onPressed: () => {},
                    text: "Mark Delivered",
                  )
                ),

              ],
            )
        ),
      );

  }
}