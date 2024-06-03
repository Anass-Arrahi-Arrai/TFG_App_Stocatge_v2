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
  
  List<Order> getOrders(){
    return List<Order>.from(orders);
  }
  void removeOrder(String orderId) {
    final orderIndex = orders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      orders.removeAt(orderIndex);
      saveOrders(); 
    }
  }
  void saveOrders() {
    boxOrders.clear();
    for (var order in orders) {
      boxOrders.add(order);
    }
  }
  
  void add(Order order){
    boxOrders.put(order.id, order);
    orders.add(order);
  }
  
  void loadOrders(){
    for (var element in boxOrders.values) {
      orders.add(element);
    }
  }
  
  void updateOrder(Order updatedOrder) {
    final orderIndex = orders.indexWhere((order) => order.id == updatedOrder.id);
    if (orderIndex != -1) {
      orders[orderIndex] = updatedOrder;
      boxOrders.put(updatedOrder.id, updatedOrder); 
    }
  }
}