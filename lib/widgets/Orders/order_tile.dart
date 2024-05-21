// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:app_stocatge/widgets/Orders/mark_arrived_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/order.dart';


class OrderTile extends StatefulWidget { 

  final Order order;
  
  Function(BuildContext)? onDelete;
  OrderTile({
    super.key, 
    required this.order,
    required this.onDelete,
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
        child: Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.15,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: widget.onDelete,
                padding: EdgeInsets.zero,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
            ],
        ),
          child: Container(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.brown[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
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
        ),
      );

  }
}