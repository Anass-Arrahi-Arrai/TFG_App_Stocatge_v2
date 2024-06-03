import 'package:app_stocatge/widgets/Graphs/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {

  final List weeklySummary;
  const MyBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        monAmmount: weeklySummary[0],
        tueAmmount: weeklySummary[1],
        wedAmmount: weeklySummary[2],
        thurAmmount: weeklySummary[3],
        friAmmount: weeklySummary[4],
        satAmmount: weeklySummary[5],
        sunAmmount: weeklySummary[6],
      );
    
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 20,
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
                  toY: data.y, 
                  color: Colors.brown[600],
                  width: 20,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 20,
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

    switch (value.toInt()){
      case 0:
        text = const Text('Poher', style: style,);
        break;
      case 1:
        text = const Text('Fatima Zahra', style: style,);
        break;
      case 2:
        text = const Text('Wed', style: style,);
        break;
      case 3:
        text = const Text('Thur', style: style,);
        break;
      case 4:
        text = const Text('Fri', style: style,);
        break;
      case 5:
        text = const Text('Sat', style: style,);
        break;
      case 6:
        text = const Text('Sun', style: style,);
        break;
      default:
        text = const Text('', style: style,);
        break;
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide,);
  }
}