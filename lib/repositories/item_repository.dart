
// ignore_for_file: avoid_print

import 'package:app_stocatge/models/item.dart';
import 'package:hive/hive.dart';

class ItemRepository {

  Map <String, List<Item>> items = {};
  late Box<Item> boxItems;
  ItemRepository(){
    init();
  }
  
  void init() {
    boxItems = Hive.box<Item>('itemsBox');
    loadItems();
  }
  List<Item> getItems(String supplier){
    if(items[supplier]!=null){
      return items[supplier] as List<Item>;
    }
    return [];
  }
  // Load All supplier items from db
  void loadItems() {
    items.clear();  
    for (var item in boxItems.values) {
      if (!items.containsKey(item.supplierItem)) {
        items[item.supplierItem] = [];
      }
      items[item.supplierItem]!.add(item);
    }
  }


  //Set new item to supplier
  void setNewItem(String supName, Item newItem){
    if (!items.containsKey(supName)) {
      items[supName] = [];
    }
    items[supName]!.add(newItem);  // Agregar el nuevo ítem a la lista del proveedor.
    boxItems.add(newItem);
  }

  //Print items of certain supplier
  void printSupplierItems(String supName){
    print("Items for $supName:\n");
    for (var item in items[supName]!) {
      print("   ${item.productId}: ${item.productName},${item.unitPrice}");
    }
  }
  

  //Print all items of all suppliers
  void printAllItems() {
    // Iterate over each supplier in the item repository
    print("hello");
    print(items.length);
    items.forEach((supName, items) {
        print("Items for $supName:");
        for (var item in items) {
            
            print("   ${item.productId}: ${item.itemType}: ${item.productName},${item.unitPrice},${item.itemFormat} "); // Print each item's product name
        }
        print("");  // Add a blank line for better readability between suppliers
    });
  }

}