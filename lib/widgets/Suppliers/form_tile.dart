
import 'package:app_stocatge/utilities/text_form_field_doubles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FormTile extends StatelessWidget { 
  final TextEditingController controller;
  final String dataName;
  final String? Function(String?)? validator;
  final bool isNumber;
  
  FormTile({
    super.key, 
    required this.dataName,
    required this.controller,
    this.isNumber = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.brown[100],
            borderRadius: BorderRadius.circular(10),
          ),
            child: Row(
              children: [
                Text(
                  dataName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: (isNumber)  ? TextInputType.number: null,
                    inputFormatters: (isNumber)  ? [DecimalTextInputFormatter(decimalRange: 2)] : null,
                    validator: validator,
                    controller: controller,
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize:10,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter $dataName',
                      hintStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                      border: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.brown, width: 1.5), 
                      ),
                      filled: false,
                      fillColor: Colors.brown[200],
                    ),
                  ),
                ),

              ],
            )
        ),
      );

  }
}