

import "package:app_stocatge/repositories/order_repository.dart";
import "package:app_stocatge/widgets/Graphs/my_bar_graph.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

import "../models/order.dart";

class StatsPage extends StatelessWidget {

  StatsPage({super.key});
  OrderRepository orderRepository = OrderRepository();
  
  @override
  Widget build(BuildContext context) {

    List<double> weeklySummary = [4.4, 4.5, 5.3, 6.8, 5.7, 10.4, 19];
    
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
        child: SizedBox(
          height: 200,
          child: MyBarGraph(weeklySummary: weeklySummary)
        ),
      ),
    );
  }
}