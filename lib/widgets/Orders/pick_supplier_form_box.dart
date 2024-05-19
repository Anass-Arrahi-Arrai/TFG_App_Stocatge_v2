// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:app_stocatge/repositories/supplier_repository.dart';
import 'package:app_stocatge/widgets/Orders/supplier_order_form.dart';
import 'package:flutter/material.dart';

import '../../models/supplier.dart';
import 'supplier_button.dart';



class PickSupplierFormBox  extends StatefulWidget {
  final Function(Supplier) onPicked;
  const PickSupplierFormBox({super.key, required this.onPicked});

  @override
  State<PickSupplierFormBox> createState() => _PickSupplierToOrderBoxState();
}

class _PickSupplierToOrderBoxState extends State<PickSupplierFormBox> {
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
                child: suppliers.isEmpty ?
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.brown,
                      width: 3.0,
                    ),
                  ),
                  child: Center(
                          child: Text(
                            "NO SUPPLIERS YET",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                )
                :
                ListView.builder(
                  itemCount: suppliers.length,  // Number of items in the list
                  itemBuilder: (context, index) {
                    return SupplierButton(text: suppliers[index].name, onPressed: () => widget.onPicked(suppliers[index]));
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

