

import 'package:app_stocatge/repositories/supplier_repository.dart';
import 'package:app_stocatge/widgets/my_button.dart';
import 'package:app_stocatge/widgets/Orders/share_order_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/order.dart';
import '../../models/supplier.dart';

class checkOrderBox extends StatelessWidget {

  final Order order;
  SupplierRepository sR = SupplierRepository();
  
  checkOrderBox({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Supplier supplier = sR.getSupplierByName(order.getSupplier());
    Map<String, dynamic> supData = supplier.toMap();
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Check ${supplier.getName} Order ", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
        ),
      insetPadding: const EdgeInsets.only(top:80, bottom: 40),
      contentPadding: const EdgeInsets.all(10),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.fact_check_rounded, size: 60, color: Colors.brown[800]),
      content: Container(
        width: 375,
        height: 375,
        child: Column(
          children: [
           Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.brown,
                        width: 3.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "ITEMS ORDERED",
                          style: TextStyle(
                            color: Colors.brown[800],
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Product",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.brown[800],
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ),
                            Expanded(
                              child: Text(
                                "Format",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.brown[800],
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ),
                            Expanded(
                              child: Text(
                                "Quantity",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.brown[800],
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ),
                          ],
                        ),
                      
                        Expanded(
                          child: ListView.builder(
                            itemCount: order.items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                                child: Row(
                                  children: [
                                    Text("${index+1}.    "),
                                    Expanded(
                                      child: Text(
                                        "${order.items[index].item.productName}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.brown[800],
                                          fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ),
                                    Expanded(
                                      child: Text(
                                        "${order.items[index].item.lotQuantity} ${order.items[index].item.uom} ${order.items[index].item.itemFormat}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.brown[800],
                                          fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ),
                                    Expanded(
                                      child: Text(
                                        "${order.items[index].quantity}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.brown[800],
                                          fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(width: 10,),
                  
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.brown,
                    width: 3.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TOTAL AMOUNT: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                        fontSize: 15
                      ),
                    ),
                    SizedBox(width: 30,),
                    Text(
                      "${order.getTotal().toStringAsFixed(2)}€",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[600],
                        fontSize: 30
                      ),
                    )
                
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                color: Colors.white,
                child: MyButton(
                  onPressed: () => {
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return ShareOrderBox(order: order);
                      },
                    )
                  },
                  text: "SEND ORDER",
                  isEnabled: true,
                )
              ),
            ) 
          
          ],
        ),
      )
    );
  }
  
  String toSentenceCase(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }
}