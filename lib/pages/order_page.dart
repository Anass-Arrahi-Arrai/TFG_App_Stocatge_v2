// ignore_for_file: prefer_const_constructors

import "package:app_stocatge/repositories/item_repository.dart";
import "package:app_stocatge/widgets/form_tile.dart";
import "package:flutter/material.dart";

import "../widgets/Orders/pick_supplier_to_order_box.dart";

class OrdersPage extends StatefulWidget {
  OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final ItemRepository itemRep = ItemRepository();

  createNewOrder() {
    showDialog(
      context: context, 
      builder: (context) {
        return PickSupplierToOrderBox();
      },
      );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Make Order Page",
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
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Current Orders",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,

                ),
              ),
            ),
          ),
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
                  children:[
                    FormTile(controller: TextEditingController(), dataName: "hello",),
                  ]
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 80),
              child: Text(
                "Create New Order",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[900]
                ),
                ),
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewOrder(),
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      )
    );
  }
}