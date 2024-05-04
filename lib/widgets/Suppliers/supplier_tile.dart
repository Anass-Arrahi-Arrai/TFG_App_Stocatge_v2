// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SupplierTile extends StatelessWidget { 
  final String supplierName;
  final bool active;
  Function(BuildContext)? modifySupplier;
  Function(BuildContext)? setInactive;
  Function(BuildContext)? addItem;
  SupplierTile({
    super.key, 
    required this.supplierName,
    required this.active,
    required this.setInactive,
    required this.modifySupplier,
    required this.addItem
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: active,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.35,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: setInactive,
                padding: EdgeInsets.zero,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              SlidableAction(
                padding: EdgeInsets.zero,
                onPressed: modifySupplier,
                icon: Icons.edit_note_sharp,
                backgroundColor: Colors.green,
                borderRadius: BorderRadius.circular(20),
                ),
                SlidableAction(
                padding: EdgeInsets.zero,
                onPressed: addItem,
                icon: Icons.post_add_rounded,
                backgroundColor: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
                )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                supplierName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[900]
                ),
                )
              ),
          ),
        ),
      ),
    );
  }
}