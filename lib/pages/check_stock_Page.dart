// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";

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

  void _incrementCounter() {
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
