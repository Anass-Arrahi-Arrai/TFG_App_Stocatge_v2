// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, collection_methods_unrelated_type, unused_local_variable

import 'package:app_stocatge/repositories/stock_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateStockBox extends StatelessWidget {
  final int idx;
  double value = 0.0;
  final TextEditingController controller;
  final Function(int, double) onUpdated;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UpdateStockBox({
    super.key,
    required this.onUpdated,
    required this.controller,
    required this.idx,
    required this.sR,
    required this.validator,
  });

  final StockRepository sR;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Check Order",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
      ),
      insetPadding: const EdgeInsets.only(top: 80, bottom: 40),
      contentPadding: const EdgeInsets.all(10),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.fact_check_rounded, size: 60, color: Colors.brown[800]),
      content: Form(
        key: _formKey,
        child: IntrinsicHeight(
          child: Container(
            child: Column(
              children: [
                Text(
                  "Update ${sR.types[idx]} value",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextFormField(
                      validator: validator,
                      controller: controller,
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter quantity used',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10.0, right: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.brown,
                              width: 1.5), // Brown border color
                        ),
                        filled: false,
                        fillColor: Colors.brown[200],
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 14,
              color: Colors.brown[800]
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              value = double.tryParse(controller.text) ?? 0.0;
              onUpdated(idx, value);
            }
          },
          child: Text(
            'Update',
            style: TextStyle(
              fontSize: 14,
              color: Colors.green[800]
            ),
            ),
        ),
      ],
    );
  }
}
