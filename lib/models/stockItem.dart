
import 'package:hive/hive.dart';
part 'stockItem.g.dart';

@HiveType(typeId: 5)
class StockItem{

  @HiveField(0)
  String itemType;
  @HiveField(1)
  double quantity;
  @HiveField(2)
  String itemFormat;


  StockItem ({
    required this.itemFormat,
    required this.itemType,
    required this.quantity
  });

  


}