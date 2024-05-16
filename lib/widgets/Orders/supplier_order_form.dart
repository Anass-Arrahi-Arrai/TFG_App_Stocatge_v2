import "package:app_stocatge/models/order.dart";
import "package:app_stocatge/models/orderItem.dart";
import "package:app_stocatge/repositories/item_repository.dart";
import "package:app_stocatge/widgets/Orders/item_order_tile.dart";
import "package:app_stocatge/widgets/my_button.dart";
import "package:flutter/material.dart";

import "../../models/item.dart";
import "../../models/supplier.dart";

class SupplierItemsForm extends StatefulWidget {
  final Supplier supplier;

  SupplierItemsForm({super.key, required this.supplier});

  @override
  State<SupplierItemsForm> createState() => _SupplierItemsFormState();
}

class _SupplierItemsFormState extends State<SupplierItemsForm> {
  
  final ItemRepository iRepo = ItemRepository();
  final List<TextEditingController> _controllers = [];
  
  
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
    List<Item>? items = iRepo.items[widget.supplier.name];
    if (items != null) {
      for (int i = 0; i < items.length; i++) {
        _controllers.add(TextEditingController());
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
                      return ItemOrderTile(controller: _controllers[index], item: items[index]);
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
                    // ignore: prefer_is_empty
                    items != null && items.isNotEmpty ? MyButton(text: "Save", onPressed: handleSave,) : MyButton(text: "Save", onPressed: handleSave, isEnabled: false,),
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
    //Crear tots els itemOrders
    List<OrderItem> orderItems = [];
    List<Item>? items = iRepo.items[widget.supplier.name];
    if(items!=null){
      for (var idx = 0 ; idx<items.length  ; idx++ ){
        int quantity = int.tryParse(_controllers[idx].text) ?? 0;
        orderItems.add(OrderItem(item: items[idx], quantity: quantity));
      }
    }
    orderItems.forEach((element) {element.printOrderItem();});
    //Crear Order
    
    //Transform order to text, and send it via, mail, whatsapp, etc. 

    //Close Order box
    Navigator.of(context).pop();
  }
}