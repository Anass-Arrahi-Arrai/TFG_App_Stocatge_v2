// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:app_stocatge/models/item.dart";
import "package:app_stocatge/models/supplier.dart";
import "package:app_stocatge/repositories/item_repository.dart";
import "package:app_stocatge/repositories/order_repository.dart";
import "package:app_stocatge/repositories/supplier_repository.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";

import "../models/order.dart";

//Stateles widgets mai canvien les coses en pantalla, els statefull sí canvien depenent del estat!!
class CheckStockPage extends StatefulWidget {
  const CheckStockPage({super.key});

  @override
  State<CheckStockPage> createState() => _CheckStockPageState();
}

class _CheckStockPageState extends State<CheckStockPage> {
  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Check Stock Page",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Stock",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          // Text
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0, right: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.brown[300]
                ),
                child: ListView(
                  
                  
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
