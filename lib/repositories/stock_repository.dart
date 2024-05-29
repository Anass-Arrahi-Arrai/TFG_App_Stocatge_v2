import 'package:app_stocatge/models/orderItem.dart';
import 'package:app_stocatge/repositories/food_format_types.dart';
import 'package:hive/hive.dart';

class StockRepository {
  List<double> stocks = [];
  List<String> types = FoodAndFormatTypes.types.keys.toList();
  late Box<double> boxStock;

  StockRepository() {
    init();
  }

  void init() {
    boxStock = Hive.box<double>('itemStockBox');
    loadStock();

    // Ensure all types from FoodAndFormatTypes are present
    for (var type in FoodAndFormatTypes.types.keys) {
      if (!types.contains(type)) {
        types.add(type);
        stocks.add(0.0);
      }
    }

    saveStock();
  }

  void loadStock() {
    // Initialize the stocks list with 0.0 for each type
    stocks = List<double>.filled(types.length, 0.0);

    // Load existing stock values from boxStock
    for (var key in boxStock.keys) {
      int index = types.indexOf(key);
      if (index != -1) {
        stocks[index] = boxStock.get(key, defaultValue: 0.0)!;
      }
    }

    print("Stock loaded from DB:\n");
    for (int i = 0; i < types.length; i++) {
      print("${types[i]}: ${stocks[i]}\n");
    }
  }

  void saveStock() {
    for (int i = 0; i < types.length; i++) {
      boxStock.put(types[i], stocks[i]);
    }
  }

  void addStock(OrderItem oI) {
    int index = types.indexOf(oI.item.itemType as String);
    if (index != -1) {
      stocks[index] += oI.quantity * oI.item.lotQuantity;
    } else {
      types.add(oI.item.itemType as String);
      stocks.add(oI.quantity.toDouble() * oI.item.lotQuantity);
    }
    saveStock();
  }

  void removeStock(String itemType, double quantity) {
    int index = types.indexOf(itemType);
    if (index != -1) {
      stocks[index] = (stocks[index] - quantity).clamp(0, double.infinity);
      saveStock();
    }
  }

  void removeStockByIdx(int idx, double quantity) {
    if (idx != -1) {
      stocks[idx] = (stocks[idx] - quantity).clamp(0, double.infinity);
      saveStock();
    }
  }

  double getStockQuantity(String itemType) {
    int index = types.indexOf(itemType);
    return index != -1 ? stocks[index] : 0.0;
  }

  double getStockQuantityByIdx(int idx) {
    return idx != -1 ? stocks[idx] : 0.0;
  }

  void printStock() {
    for (int i = 0; i < types.length; i++) {
      print("Type: ${types[i]}, Quantity: ${stocks[i]}");
    }
  }
}
