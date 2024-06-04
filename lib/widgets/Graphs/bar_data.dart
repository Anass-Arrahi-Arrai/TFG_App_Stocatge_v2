import 'package:app_stocatge/repositories/order_repository.dart';
import 'package:app_stocatge/widgets/Graphs/individual_bar.dart';

class BarData{

  OrderRepository iR = OrderRepository();
  List<double> amountOfSomething;
  

  BarData({
    required this.amountOfSomething,
    
  });
  
  List<IndividualBar> barData = [];
  void initializeBarData(){
    for ( var idx = 0 ; idx<amountOfSomething.length  ; idx++ ){
      barData.add(IndividualBar(x: idx, y: amountOfSomething[idx]));
    }
  }
}