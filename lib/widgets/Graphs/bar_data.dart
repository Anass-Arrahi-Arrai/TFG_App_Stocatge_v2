import 'package:app_stocatge/widgets/Graphs/individual_bar.dart';

class BarData{
  final double monAmmount;
  final double tueAmmount;
  final double wedAmmount;
  final double thurAmmount;
  final double friAmmount;
  final double satAmmount;
  final double sunAmmount;

  BarData({
    required this.monAmmount,
    required this.tueAmmount,
    required this.wedAmmount,
    required this.thurAmmount,
    required this.friAmmount,
    required this.satAmmount,
    required this.sunAmmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData(){
    barData = [
      IndividualBar(x: 0, y: monAmmount),
      IndividualBar(x: 1, y: tueAmmount),
      IndividualBar(x: 2, y: wedAmmount),
      IndividualBar(x: 3, y: thurAmmount),
      IndividualBar(x: 4, y: friAmmount),
      IndividualBar(x: 5, y: satAmmount),
      IndividualBar(x: 6, y: sunAmmount),
    ];
  }
}