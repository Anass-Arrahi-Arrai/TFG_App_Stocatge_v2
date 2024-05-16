import 'package:app_stocatge/models/orderItem.dart';

class Order {
  int id;
  int supplierId;
  DateTime date;
  List<OrderItem> items;
  bool received;

  Order({
    required this.id,
    required this.supplierId,
    required this.date,
    required this.items,
    this.received = false,
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

  void updateStatus(bool newStatus) {
    received = newStatus;
  }

  @override
  String toString() {
    return 'Order{id: $id, supplierId: $supplierId, date: $date, items: $items, status: $received}';
  }
}

