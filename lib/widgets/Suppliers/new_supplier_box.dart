// ignore_for_file: sized_box_for_whitespace

import 'package:app_stocatge/widgets/form_tile.dart';
import 'package:app_stocatge/widgets/my_button.dart';
import 'package:flutter/material.dart';



class NewSupplierBox  extends StatelessWidget {
  
  final Function(Map<String, String>) onSave;
  
  NewSupplierBox({super.key, required this.onSave});

  final nameController = TextEditingController();
  final nifController = TextEditingController();
  final addressController = TextEditingController();
  final municipationController = TextEditingController();
  final provinceController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();
  final numberController = TextEditingController();
  
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
                child: ListView(
                  children: [
                    FormTile(dataName: "Fiscal Name",controller: nameController,),
                    FormTile(dataName: "NIF",controller: nifController),
                    FormTile(dataName: "Address",controller: addressController),
                    FormTile(dataName: "Municipation",controller: municipationController),
                    FormTile(dataName: "Province",controller: provinceController),
                    FormTile(dataName: "ZIP Code",controller: zipController),
                    FormTile(dataName: "Country",controller: countryController),
                    FormTile(dataName: "Phone num",controller: numberController),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(text: "Save", onPressed: handleSave),
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
    );
  }
  
  void handleSave() {
    Map<String, String> newSupplierData = {
      'name': nameController.text,
      'nif': nifController.text,
      'address': addressController.text,
      'municipation': addressController.text,
      'province': addressController.text,
      'zip': addressController.text,
      'country': addressController.text,
      'num': addressController.text,
    };
    onSave(newSupplierData);
  }
}