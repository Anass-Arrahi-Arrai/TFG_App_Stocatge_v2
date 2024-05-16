// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:app_stocatge/models/item.dart";
import "package:app_stocatge/models/supplier.dart";
import "package:app_stocatge/repositories/item_repository.dart";
import "package:app_stocatge/repositories/supplier_repository.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";

//Stateles widgets mai canvien les coses en pantalla, els statefull sí canvien depenent del estat!!
class CheckStockPage extends StatefulWidget {
  const CheckStockPage({super.key});

  @override
  State<CheckStockPage> createState() => _CheckStockPageState();
}

class _CheckStockPageState extends State<CheckStockPage> {
  // variable
  int _counter = 0;
  // method
  
  Box<Item> boxItems = Hive.box<Item>('itemsBox');
  Box<Supplier> supplierItems = Hive.box<Supplier>('supplierBox');
  ItemRepository iR = ItemRepository();
  SupplierRepository iS = SupplierRepository();
  void _incrementCounter() {
    setState(() {
      iR.items.clear();
      iS.suppliers.clear();
      boxItems.clear();
      supplierItems.clear();
    });
    
    
    print("boxes cleared");
    //Rebuilds the widget, vamos, que lo actualiza en pantalla.
    setState(() {
      _counter++;
    });
  }

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
          // Text
          Center(
              //Message
              child: Text("U pushed the button this many times:")),
          // Number
          Text(
            _counter.toString(),
            style: TextStyle(fontSize: 50),
          ),
          // Button
          ElevatedButton(
          
            onPressed: _incrementCounter, 
            child: Text("Increment!"),
            ),
        ],
      ),
    );
  }
}
