// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:app_stocatge/repositories/supplier_repository.dart';
import 'package:flutter/material.dart';



class PickSupplierToOrderBox  extends StatefulWidget {
  
  PickSupplierToOrderBox({super.key});

  @override
  State<PickSupplierToOrderBox> createState() => _PickSupplierToOrderBoxState();
}

class _PickSupplierToOrderBoxState extends State<PickSupplierToOrderBox> {
  SupplierRepository sRepo = SupplierRepository();

  @override
  Widget build(BuildContext context) {
    var suppliers = sRepo.allSuppliers.where((sup) => sup.active == true).toList();
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Pick Supplier To Order", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
        ),
      insetPadding: const EdgeInsets.only(top:80, bottom: 40),
      contentPadding: const EdgeInsets.all(10),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.person, size: 60, color: Colors.brown[800]),
      backgroundColor: Colors.brown[200],
      content: Container(
        width: 375,
        height: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10)
              ),
                child: ListView.builder(
                  itemCount: suppliers.length,  // Number of items in the list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            suppliers[index].name,  // Display the supplier name dynamically
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
          ]
          
        ),
      ),
    );
  }
}