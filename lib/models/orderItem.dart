import 'package:app_stocatge/models/item.dart';

class OrderItem {

  Item item;
  int quantity;

  double get totalPrice => item.unitPrice * quantity;

  OrderItem({
    required this.item,
    required this.quantity
  });

  // Método para actualizar la cantidad de un producto
  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
  }
  
}