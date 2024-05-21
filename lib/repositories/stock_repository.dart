import 'package:app_stocatge/models/item.dart';
import 'package:app_stocatge/models/stockItem.dart';
import 'package:hive/hive.dart';

class StockRepository{
  List<StockItem> stock= [];
  late Box<StockItem> boxStock;
  StockRepository() {
    init();
  }

  void init() {
    boxStock = Hive.box<StockItem>('stockBox');
    loadStock();
  }

  void loadStock() {
    stock.clear();
    for (var entry in boxStock.values) {
      stock.add(entry);
    }
  }

  void saveStock() {
    boxStock.clear();
    for (var entry in stock) {
      boxStock.add(entry);
    }
  }

  void addStock(Item item, int quantity) {
    var stockItem = stock.firstWhere((element) => element.item.productId == item.productId, orElse: () => StockItem(item: item, quantity: 0));
    if (stockItem.quantity == 0) {
      stock.add(StockItem(item: item, quantity: quantity));
    } else {
      stockItem.quantity += quantity;
    }
    saveStock();
  }

  void removeStock(Item item, int quantity) {
    
  }

  int getStockQuantity(Item item) {
    return 0;
  }


}