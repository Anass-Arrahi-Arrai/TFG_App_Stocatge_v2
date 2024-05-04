import 'package:app_stocatge/models/orderItem.dart';

class Order {
  int id;
  int supplierId;
  DateTime date;
  List<OrderItem> items;
  String status;

  Order({
    required this.id,
    required this.supplierId,
    required this.date,
    required this.items,
    required this.status,
  });

  void addItem(OrderItem newItem) {
    items.add(newItem);
  }

  void removeItem(OrderItem item) {
    items.remove(item);
  }

  double getTotal() {
    return items.fold(0, (total, current) => total + current.totalPrice);
  }

  void updateStatus(String newStatus) {
    status = newStatus;
  }

  @override
  String toString() {
    return 'Order{id: $id, supplierId: $supplierId, date: $date, items: $items, status: $status}';
  }
}

