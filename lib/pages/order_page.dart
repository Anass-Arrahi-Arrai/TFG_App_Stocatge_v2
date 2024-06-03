

import "package:app_stocatge/repositories/item_repository.dart";
import "package:app_stocatge/repositories/order_repository.dart";
import "package:app_stocatge/repositories/stock_repository.dart";
import "package:app_stocatge/widgets/Orders/order_tile.dart";
import "package:app_stocatge/widgets/Orders/share_order_box.dart";
import "package:flutter/material.dart";

import "../models/order.dart";
import "../models/supplier.dart";
import "../widgets/Orders/check_order_box.dart";
import "../widgets/Orders/pick_supplier_form_box.dart";
import "../widgets/Orders/supplier_order_form.dart";

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final ItemRepository itemRep = ItemRepository();
  final OrderRepository orderRep = OrderRepository();
  final StockRepository stockRep = StockRepository();
  

  void updateStock(Order order) {
    setState(() {
      for (var orderItem in order.items) {
        stockRep.addStock(orderItem);
      }
      
    });
  }
  
  
  void saveOrder(Order order){
    Navigator.of(context).pop();
    showDialog(
      context: context, 
      builder: (context) {
        
        return ShareOrderBox(order: order);
      },
    );
    setState(() {
      orderRep.add(order);
    });
    
  }

  void openOrderForm(Supplier supplier) {
    Navigator.of(context).pop();
    showDialog(
      context: context, 
      builder: (context) {
        return SupplierItemsForm(
          supplier: supplier,
          onSave: (Order)=>saveOrder(Order),
        );
      },
    );
  }
  void createNewOrder() {
    showDialog(
      context: context, 
      builder: (context) {
        return PickSupplierFormBox(
          onPicked: (Supplier) => openOrderForm(Supplier),
        );
      },
    );
  }
  checkOrder(Order order) {
    showDialog(
      context: context, 
      builder: (context) {
        return checkOrderBox(order: order);
      },
    );
  }
  void deleteOrder(Order order) async{
    bool confirm = await _showConfirmationDialog(context);
    if(confirm){
      setState(() {
        orderRep.removeOrder(order.id);
      });
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm Deletion',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[700],
          ),
          ),
        content: Text('Are you sure you want to delete this order? This action is irreversible and cannot be undone.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          ),
        ],
      );
    },
  ) ?? false; 
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
                child: orderRep.getOrders().isEmpty ? 
                Container(
                  width: 500,
                  child: Center(
                    child: Text(
                      "No orders Yet",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                      )
                    )
                  )
                :
                ListView.builder(
                  itemCount: orderRep.getOrders().length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => checkOrder(orderRep.getOrders()[index]),
                      child: OrderTile(
                        order: orderRep.getOrders()[index], 
                        onDelete: (context) => deleteOrder(orderRep.getOrders()[index]), 
                        onDelivered: (context) => updateStock(orderRep.getOrders()[index]),
                        ));
                  },
                  
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