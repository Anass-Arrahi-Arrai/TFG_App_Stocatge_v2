import 'package:hive/hive.dart';

import '../models/order.dart';

class OrderRepository {

  List<Order> orders = [];
  late Box<Order> boxOrders;
  OrderRepository(){
    init();
  }

  void init(){
    boxOrders = Hive.box<Order>("orderBox");
    loadOrders();
  }
  //Method to get all orders
  List<Order> getOrders(){
    return List<Order>.from(orders);
  }
  void removeOrder(String orderId) {
    final orderIndex = orders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      orders.removeAt(orderIndex);
      saveOrders(); // Update Hive box
    }
  }
  void saveOrders() {
    boxOrders.clear();
    for (var order in orders) {
      boxOrders.add(order);
    }
  }
  //Method to add new orders in list, and also add it in hive db. 
  void add(Order order){
    boxOrders.put(order.id, order);
    orders.add(order);
  }
  //Method to load all orders from hive db. 
  void loadOrders(){
    for (var element in boxOrders.values) {
      orders.add(element);
    }
  }
  
  void updateOrder(Order updatedOrder) {
    final orderIndex = orders.indexWhere((order) => order.id == updatedOrder.id);
    if (orderIndex != -1) {
      orders[orderIndex] = updatedOrder;
      boxOrders.put(updatedOrder.id, updatedOrder); // Update Hive box
    }
  }
}