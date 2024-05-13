// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
//import 'package:app_stocatge/models/item.dart';
import 'package:app_stocatge/models/supplier.dart';
import 'package:app_stocatge/pages/home_page.dart';
import 'package:app_stocatge/pages/supplier_manager_page.dart';
import 'package:app_stocatge/pages/order_page.dart';
import 'package:app_stocatge/pages/stats_page.dart';
import 'package:app_stocatge/repositories/boxes.dart';
import 'package:flutter/material.dart';
import 'package:app_stocatge/pages/check_stock_Page.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/item.dart';

void main() async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  
  Hive.registerAdapter(SupplierAdapter());
  Hive.registerAdapter(ItemAdapter());

  boxItems = await Hive.openBox<Item>('itemsBox');
  boxSuppliers = await Hive.openBox<Supplier>('supplierBox');
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.brown),
      routes: {
        '/checkStock' :(context) => CheckStockPage(),
        '/orders' : (context) => OrdersPage(),
        '/stats' : (context) => StatsPage(),
        '/suppliers' : (context) => SupplierManager(),
        
      }
    );
  }
}

