

import 'package:app_stocatge/models/item.dart';
import 'package:app_stocatge/widgets/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


class ItemOrderTile extends StatefulWidget {
  
  final TextEditingController controller;
  final Item item;
  int quantity;

  ItemOrderTile({super.key, required this.controller, required this.item, this.quantity = 0});

  @override
  State<ItemOrderTile> createState() => _ItemOrderTileState();
}

class _ItemOrderTileState extends State<ItemOrderTile> {
  
  @override
  void initState() {
    
    super.initState();
    widget.controller.addListener(updateQuantityFromTextField);
  }
  @override
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
                  child: Center(
                    child: Text(
                      widget.item.productName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "(${widget.item.lotQuantity}${widget.item.uom} ${widget.item.itemFormat!})",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize:10,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter quantity',
                      hintStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(8),
                         
                      ),
                      focusedBorder: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.brown, width: 1.5), 
                      ),

                      filled: false,
                      fillColor: Colors.brown[200],
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                
              ],
            )
        ),
      );
  }
  
  void updateQuantityFromTextField() {
    final text = widget.controller.text;
    if (text.isNotEmpty) {
      final number = int.tryParse(text);
      if (number != null && number >= 0) {
        setState(() {
          widget.quantity = number;
        });
      }
    } else {
      setState(() {
        widget.quantity = 0;
      });
    }
  }
}