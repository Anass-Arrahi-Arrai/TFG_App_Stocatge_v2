// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, collection_methods_unrelated_type, unused_local_variable

import 'package:app_stocatge/repositories/stock_repository.dart';
import 'package:app_stocatge/widgets/stock/type_stock_tile.dart';
import 'package:app_stocatge/widgets/stock/update_stock_box.dart';
import 'package:flutter/material.dart';

class CheckStockPage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();

  CheckStockPage({super.key});

  @override
  State<CheckStockPage> createState() => _CheckStockPageState();
}

class _CheckStockPageState extends State<CheckStockPage> {
  // UI
  var _formKey = GlobalKey<FormState>();
  StockRepository sR = StockRepository();

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
              padding:
                  const EdgeInsets.only(left: 25.0, bottom: 25.0, right: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.brown[300]),
                child: ListView.builder(
                  itemCount: sR.types.length,
                  itemBuilder: (context, index) {
                    return TypeStockTile(
                      onUpdate: (context) => updateStockDialog(index),
                      quantity: sR.stocks[index],
                      itemType: sR.types[index],
                      idx: index,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  updateStockDialog(int idx) {
    showDialog(
      context: context,
      builder: (context) {
        widget.controller.clear();
        return UpdateStockBox(
          validator: (value) => validateNotEmpty(value, idx),
          sR: sR,
          idx: idx,
          controller: widget.controller,
          onUpdated: (idx, value) => updateStockNumber(idx, value),
        );
        
      },
    );
  }

  String? validateNotEmpty(String? value, int idx) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    double? parsedValue = double.tryParse(value);
    if (parsedValue == null || parsedValue <= 0) {
      return 'Enter a valid number greater than 0';
    }
    if (sR.stocks[idx] - parsedValue < 0) {
      return 'Insufficient stock';
    }
    return null;
  }

  updateStockNumber(int idx, double value) {
    Navigator.of(context).pop();
    setState(() {
      sR.removeStockByIdx(idx, value);
    });
  }
}
