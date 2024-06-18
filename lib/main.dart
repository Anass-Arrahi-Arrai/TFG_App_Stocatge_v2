import 'package:app_stocatge/models/order.dart';
import 'package:app_stocatge/models/orderItem.dart';
import 'package:app_stocatge/models/stockItem.dart';
import 'package:app_stocatge/models/supplier.dart';
import 'package:app_stocatge/models/user.dart';
import 'package:app_stocatge/pages/home_page.dart';
import 'package:app_stocatge/pages/supplier_manager_page.dart';
import 'package:app_stocatge/pages/order_page.dart';
import 'package:app_stocatge/pages/stats_page.dart';
import 'package:app_stocatge/pages/user_data_page.dart';
import 'package:app_stocatge/repositories/boxes.dart';
import 'package:app_stocatge/repositories/item_repository.dart';
import 'package:app_stocatge/repositories/order_repository.dart';
import 'package:app_stocatge/repositories/stock_repository.dart';
import 'package:app_stocatge/repositories/supplier_repository.dart';
import 'package:flutter/material.dart';
import 'package:app_stocatge/pages/check_stock_Page.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/item.dart';

void main() async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  
  Hive.registerAdapter(SupplierAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(OrderAdapter());
  Hive.registerAdapter(OrderItemAdapter());
  Hive.registerAdapter(StockItemAdapter());
  Hive.registerAdapter(UserAdapter());

  boxItems = await Hive.openBox<Item>('itemsBox');
  boxSuppliers = await Hive.openBox<Supplier>('supplierBox');
  boxOrders = await Hive.openBox<Order>('orderBox');
  boxStock = await Hive.openBox<double>('itemStockBox');
  userBox = await Hive.openBox<User>('userBox');

  runApp(MyApp());
}
void clearAll(){
  ItemRepository iR = ItemRepository();
  SupplierRepository sR = SupplierRepository();
  OrderRepository oR = OrderRepository();
  StockRepository stR = StockRepository();

  iR.boxItems.clear() ;
  sR.boxSuppliers.clear();
  oR.boxOrders.clear();
  stR.boxStock.clear();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
        dialogBackgroundColor: Colors.brown[200],
        ),
      routes: {
        '/checkStock' :(context) => CheckStockPage(),
        '/orders' : (context) => OrdersPage(),
        '/stats' : (context) => StatsPage(),
        '/suppliers' : (context) => SupplierManager(),
        '/userdata' : (context) => UserDataPage()
      }
    );
  }
}

