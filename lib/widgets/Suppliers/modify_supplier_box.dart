

import 'package:app_stocatge/models/supplier.dart';
import 'package:app_stocatge/widgets/Suppliers/form_tile.dart';
import 'package:app_stocatge/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class ModifySupBox  extends StatefulWidget {
  
  final Function(Map<String, String>) onSave;
  final Supplier supplier;
  
  ModifySupBox({super.key, required this.onSave, required this.supplier});

  @override
  State<ModifySupBox> createState() => _ModifySupBoxState();
}

class _ModifySupBoxState extends State<ModifySupBox> {

  final nameController = TextEditingController();
  final nifController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  

  @override
  void initState() {
    
    nameController.text = widget.supplier.name;
    nifController.text = widget.supplier.nif;
    addressController.text = widget.supplier.address;
    numberController.text = widget.supplier.phoneNumber ?? "?";
    emailController.text = widget.supplier.email ?? "?";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "New Supplier Data", 
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
      content: Form(
        key: _formKey,
        child: Container(
          width: 375,
          height: 420,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: ListView(
                    children: [
                      FormTile(dataName: "Fiscal Name",controller: nameController,validator: validateNotEmpty,),
                      FormTile(dataName: "NIF",controller: nifController,validator: validateNotEmpty,),
                      FormTile(dataName: "Address",controller: addressController,validator: validateNotEmpty,),
                      FormTile(dataName: "E-Mail",controller: emailController,validator: validateEmail,),
                      FormTile(dataName: "Phone num",controller: numberController,validator: validatePhoneNumber,),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: "Save", onPressed: (){
                        if (_formKey.currentState?.validate() ?? false) {
                              handleSave();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please correct the errors')),
                              );
                            }
                      }),
                      const SizedBox(width: 10),
                      MyButton(
                        text: "Cancel", 
                        onPressed: (
                          () => Navigator.of(context).pop()
                        ),
                        )
                    ],
                  ),
                ),
              )
            ]
            
          ),
        ),
      ),
    );
  }
  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    final RegExp phoneRegExp = RegExp(r'^[0-9]+$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
  void handleSave() {
    Map<String, String> newSupplierData = {
      'name': nameController.text,
      'nif': nifController.text,
      'address': addressController.text,
      'email': emailController.text,
      'num': numberController.text,
    };
    widget.onSave(newSupplierData);
  }
}