// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:app_stocatge/pages/home_page.dart';
import 'package:app_stocatge/pages/make_order_page.dart';
import 'package:app_stocatge/pages/order_page.dart';
import 'package:app_stocatge/pages/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_stocatge/pages/check_stock_Page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/checkStock' :(context) => CheckStockPage(),
        '/orders' : (context) => OrdersPage(),
        '/stats' : (context) => StatsPage(),
        '/makeOrder' : (context) => MakeOrderPage(),
        
      }
    );
  }
}

