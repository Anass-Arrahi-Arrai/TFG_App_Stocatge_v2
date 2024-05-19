import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
class Item extends HiveObject {
  
  @HiveField(0)
  String supplierItem;
  @HiveField(1)
  var productId = const Uuid().v1();
  @HiveField(2)
  String productName;
  @HiveField(3)
  double unitPrice;
  @HiveField(4)
  String ?itemFormat;


  Item({
    required this.supplierItem,
    required this.productName,
    required this.unitPrice,
    this.itemFormat,
  });

  @override
  String toString() {
    return 'Item {productId: $productId, productName: $productName, unitPrice: $unitPrice}';
  }
  
}