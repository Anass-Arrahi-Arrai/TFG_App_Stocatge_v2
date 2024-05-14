// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';


class OrderTile extends StatelessWidget { 
  final TextEditingController controller;
  final String dataName;
  
  OrderTile({
    super.key, 
    required this.dataName,
    required this.controller,
  });

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
                Text(
                  dataName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                    
                    
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize:10,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter $dataName',
                      hintStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                      border: OutlineInputBorder( // Normal border
                        borderRadius: BorderRadius.circular(8),
                         // Red border color
                      ),
                      focusedBorder: OutlineInputBorder( // Border when TextField is focused
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.brown, width: 1.5), // Blue border color
                      ),
                      filled: false,
                      fillColor: Colors.brown[200],
                    ),
                  ),
                ),

              ],
            )
        ),
      );

  }
}