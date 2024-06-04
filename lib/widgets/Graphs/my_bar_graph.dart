import 'package:app_stocatge/widgets/Graphs/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {

  final Map<String,double> expenses;
  final double maxy;
  const MyBarGraph({super.key, required this.expenses, required this.maxy});
  
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      amountOfSomething: expenses.values.toList()
      );
    
    
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        backgroundColor: Colors.brown[100],
        maxY: maxy,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles)),
          ),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y>maxy? maxy:data.y, 
                  color: Colors.brown[600],
                  width: 20,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxy,
                    color: Colors.brown[200]
                  )
                  )
              ]
              
              )
            )
            .toList(),
      )
    );
  }
  Widget getBottomTitles( double value, TitleMeta meta){
    const style = TextStyle(
    color: Colors.brown,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );

  Widget text;
  if (value.toInt() < expenses.keys.toList().length) {
    text = Text(expenses.keys.toList()[value.toInt()], style: style);
  } else {
    text = const Text('', style: style);
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide, angle: 0.2);
  }
}