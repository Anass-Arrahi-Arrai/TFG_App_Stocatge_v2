import 'package:app_stocatge/models/item.dart';
import 'package:hive/hive.dart';
part 'orderItem.g.dart';

@HiveType(typeId: 3)
class OrderItem extends HiveObject{
  @HiveField(0)
  Item item;
  @HiveField(1)
  int quantity;
  @HiveField(2)
  double get totalPrice => item.unitPrice * quantity;
  

  OrderItem({
    required this.item,
    required this.quantity
  });


  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
  }
  
  void printOrderItem(){
    print("Id: ${item.productId}, type: ${item.itemType}, ${item.productName}, quantity: $quantity, total price: $totalPrice, ");
  }
}