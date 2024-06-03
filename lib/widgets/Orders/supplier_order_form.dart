import "package:app_stocatge/models/order.dart";
import "package:app_stocatge/models/orderItem.dart";
import "package:app_stocatge/repositories/item_repository.dart";
import "package:app_stocatge/repositories/order_repository.dart";
import "package:app_stocatge/widgets/Items/item_order_tile.dart";
import "package:app_stocatge/widgets/my_button.dart";
import "package:app_stocatge/widgets/Orders/share_order_box.dart";
import "package:flutter/material.dart";

import "../../models/item.dart";
import "../../models/supplier.dart";
import "check_order_box.dart";

class SupplierItemsForm extends StatefulWidget {

  final Supplier supplier;
  final Function(Order order) onSave;

  SupplierItemsForm({super.key, required this.supplier, required this.onSave});

  @override
  State<SupplierItemsForm> createState() => _SupplierItemsFormState();
}

class _SupplierItemsFormState extends State<SupplierItemsForm> {
  
  final ItemRepository iRepo = ItemRepository();
  final List<TextEditingController> _controllers = [];
  final List<GlobalKey<FormState>> _formKeys = [];
  final OrderRepository oRepo = OrderRepository();
  final _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    List<Item>? items = iRepo.items[widget.supplier.name];
    if (items != null) {
      for (int i = 0; i < items.length; i++) {
        _controllers.add(TextEditingController());
        _formKeys.add(GlobalKey<FormState>());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    List<Item>? items = iRepo.items[widget.supplier.name];
    
    
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Make an order for\n${widget.supplier.name}", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
        ),
      insetPadding: const EdgeInsets.only(top:80, bottom: 40),
      contentPadding: const EdgeInsets.all(10),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.shopping_bag, size: 60, color: Colors.brown[800]),
      backgroundColor: Colors.brown[200],
      content: Container(
        width: 375,
        height: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: items==null || items.isEmpty ?
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.brown,
                    width: 3.0,
                  ),
                ),
                child: Center(
                        child: Text(
                          "NO ITEMS YET",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.brown[800],
                          ),
                        ),
                      ),
              )
              :
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.brown,
                    width: 3.0,
                  ),
                ),
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Form(
                        key: _formKeys[index],
                        child: ItemOrderTile(
                          controller: _controllers[index], 
                          item: items[index], 
                      ));
                    },
                  ),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    items != null && items.isNotEmpty ? 
                    MyButton(
                      text: "Save", 
                      onPressed: () => checkListEmpty(),
                    ) 
                    : 
                    MyButton(text: "Save", onPressed: (){}, isEnabled: false,),
                    const SizedBox(width: 10),
                    MyButton(
                      text: "Cancel", 
                      onPressed: (
                        () => Navigator.of(context).pop()
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void handleSave() {
    
    List<OrderItem> orderItems = [];
    List<Item>? items = iRepo.items[widget.supplier.name];
    if(items!=null){
      for (var idx = 0 ; idx<items.length  ; idx++ ){
        int quantity = int.tryParse(_controllers[idx].text) ?? 0;
        if(quantity>0){
          orderItems.add(OrderItem(item: items[idx], quantity: quantity));
        }
      }
    }
    orderItems.forEach((element) {element.printOrderItem();});
    
    if(orderItems.isNotEmpty){
      Order order = Order(supplierName: widget.supplier.getName, items: orderItems);
      widget.onSave(order);
    } 
  }
  
  void checkListEmpty() {
    bool allEmpty = true;
    for (var controller in _controllers) {
      if (controller.text.isNotEmpty) {
        allEmpty = false;
        break;
      }
    }
    if (!allEmpty) {
      handleSave();
    }else {
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red[200],
            title: Text(
              "ERROR",
              style: TextStyle(
                fontSize: 25,
                color: Colors.brown[800],
                fontWeight: FontWeight.bold
              ),
            ),
            content: const Text("All fields are empty. Please enter some values."),
            actions: [
              TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
                      
  }
}