import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderRepository {
  List<Order> orders = [];
  late Box<Order> boxOrders;

  OrderRepository() {
    init();
  }

  void init() {
    boxOrders = Hive.box<Order>("orderBox");
    loadOrders();
  }

  List<Order> getOrders() {
    return List<Order>.from(orders);
  }

  void removeOrder(String orderId) {
    final orderIndex = orders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      orders.removeAt(orderIndex);
      boxOrders.delete(orderId); // Delete the order from Hive
    }
  }

  void saveOrders() {
    boxOrders.clear();
    for (var order in orders) {
      boxOrders.put(order.id, order);
    }
  }

  void add(Order order) {
    boxOrders.put(order.id, order);
    orders.add(order);
  }

  void loadOrders() {
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

  Map<String, double> getExpensesBySupplierForCurrentMonth() {
    Map<String, double> expensesBySupplier = {};

    DateTime now = DateTime.now();
    String currentMonth = DateFormat('yyyyMM').format(now);

    for (var order in orders) {
      String orderMonth = DateFormat('yyyyMM').format(order.date);
      if (orderMonth == currentMonth) {
        String supplier = order.getSupplier();
        double total = order.getTotal();

        if (expensesBySupplier.containsKey(supplier)) {
          expensesBySupplier[supplier] = expensesBySupplier[supplier]! + total;
        } else {
          expensesBySupplier[supplier] = total;
        }
      }
    }
    return expensesBySupplier;
  }

  Map<String, double> getFiveItemsMostBuyedForCurrentMonth() {
    Map<String, double> itemQuantities = {};

    DateTime now = DateTime.now();
    String currentMonth = DateFormat('yyyyMM').format(now);

    for (var order in orders) {
      String orderMonth = DateFormat('yyyyMM').format(order.date);
      if (orderMonth == currentMonth) {
        for (var orderItem in order.items) {
          if (itemQuantities.containsKey(orderItem.item.productName)) {
            itemQuantities[orderItem.item.productName] = itemQuantities[orderItem.item.productName]! + orderItem.item.lotQuantity;
          } else {
            itemQuantities[orderItem.item.productName] = orderItem.item.lotQuantity.toDouble();
          }
        }
      }
    }

    // Ordenar los items por cantidad y tomar los primeros 5
    var sortedItems = itemQuantities.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    var topFiveItems = sortedItems.take(5);

    // Convertir de nuevo a mapa
    Map<String, double> topFiveItemsMap = {};
    for (var entry in topFiveItems) {
      topFiveItemsMap[entry.key] = entry.value;
    }

    return topFiveItemsMap;
  }

  void printExpensesCurrentMonth() {
    Map<String, double> expensesBySupplier = getExpensesBySupplierForCurrentMonth();
    DateTime now = DateTime.now();
    String currentMonth = DateFormat('MMMM yyyy').format(now);

    print('Expenses for $currentMonth:');
    expensesBySupplier.forEach((supplier, amount) {
      print('$supplier: \$${amount.toStringAsFixed(2)}');
    });
  }
}
