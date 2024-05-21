import 'package:app_stocatge/models/orderItem.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
part 'order.g.dart';

@HiveType(typeId: 4)
class Order extends HiveObject{
  @HiveField(0)
  String id = const Uuid().v1();
  @HiveField(1)
  String supplierName;
  @HiveField(2)
  DateTime date = DateTime.now();
  @HiveField(3)
  List<OrderItem> items;
  @HiveField(4)
  bool received;

  Order({
    required this.supplierName,
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

  String getDate() {
    return "${DateFormat('dd/MM/yyyy, HH:mm').format(date)}";
  }

  String getSupplier(){
    return supplierName;
  }
  String getId(){
    return id;
  }
  void updateStatus(bool newStatus) {
    received = newStatus;
  }

  String itemsToString(){
    String items = "NAME  -   QUANTITY \n -------------------------------\n";
    for (var element in this.items) {
      items += "${element.item.productName}      -      ${element.quantity} \n";
    }
    return items;
  }

  @override
  String toString() {
    return 'Order to $supplierName - ${getDate()} \n\n ${itemsToString()}';
  }
}

