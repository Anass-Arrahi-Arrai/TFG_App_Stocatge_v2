import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
class Item extends HiveObject {
  @HiveField(0)
  String supplierItem;
  @HiveField(1)
  String productId;
  @HiveField(2)
  String productName;
  @HiveField(3)
  double unitPrice;


  Item({
    required this.supplierItem,
    required this.productId,
    required this.productName,
    required this.unitPrice,
  });

  @override
  String toString() {
    return 'Item {productId: $productId, productName: $productName, unitPrice: $unitPrice}';
  }
  
}