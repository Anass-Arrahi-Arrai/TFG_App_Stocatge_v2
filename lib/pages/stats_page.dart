

import "package:app_stocatge/repositories/order_repository.dart";
import "package:app_stocatge/widgets/Graphs/my_bar_graph.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/order.dart";

// ignore: must_be_immutable
class StatsPage extends StatelessWidget {

  StatsPage({super.key});
  OrderRepository orderRepository = OrderRepository();
  
  @override
  Widget build(BuildContext context) {

    OrderRepository oR = OrderRepository();
    
    Map<String, double> expensesBySupplier = {};
    for (Order order in orderRepository.getOrders()) {
      String supplier = order.getSupplier();
      double totalPrice = order.getTotal();
      if (expensesBySupplier.containsKey(supplier)) {
        expensesBySupplier[supplier] = expensesBySupplier[supplier]! + totalPrice;
      } else {
        expensesBySupplier[supplier] = totalPrice;
      }
    }

    List<BarChartGroupData> barGroups = [];
    int index = 0;
    expensesBySupplier.forEach((supplier, total) {
      barGroups.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(fromY: 0, color: Colors.blue, toY: total)
          ],
          showingTooltipIndicators: [0],
        ),
      );
      index++;
    });
    
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Stats Page",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your Charts",
                style: TextStyle(
                  color: Colors.brown[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Expanded(
              child: Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                          color: Colors.brown,
                          width: 3.0,
                        ),
                ),
                
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15, top: 15),
                      child: Text(
                        "Monthtly expenses by supplier - ${DateFormat('MM/yyyy').format(DateTime.now())}",
                        style: TextStyle(
                          color: Colors.brown[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: MyBarGraph(expenses: oR.getExpensesBySupplierForCurrentMonth(), maxy: 5000,),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15, top: 15),
                      child: Text(
                        "Most five popular items - ${DateFormat('MM/yyyy').format(DateTime.now())}",
                        style: TextStyle(
                          color: Colors.brown[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: MyBarGraph(expenses: oR.getFiveItemsMostBuyedForCurrentMonth(), maxy: 5000,),
                      )
                    ),
                  ],
                ),
              ),
                    ),
            ),
          ],
        ),
    ));
  }
}