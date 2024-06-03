


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
  
  void loadItems() {
    items.clear();  
    for (var item in boxItems.values) {
      if (!items.containsKey(item.supplierItem)) {
        items[item.supplierItem] = [];
      }
      items[item.supplierItem]!.add(item);
    }
  }


  
  void setNewItem(String supName, Item newItem){
    if (!items.containsKey(supName)) {
      items[supName] = [];
    }
    items[supName]!.add(newItem);  
    boxItems.add(newItem);
  }

  
  void printSupplierItems(String supName){
    print("Items for $supName:\n");
    for (var item in items[supName]!) {
      print("   ${item.productId}: ${item.productName},${item.unitPrice}");
    }
  }
  

  
  void printAllItems() {
    
    print("hello");
    print(items.length);
    items.forEach((supName, items) {
        print("Items for $supName:");
        for (var item in items) {
            
            print("   ${item.productId}: ${item.itemType}: ${item.productName},${item.unitPrice},${item.itemFormat} "); 
        }
        print("");  
    });
  }

}