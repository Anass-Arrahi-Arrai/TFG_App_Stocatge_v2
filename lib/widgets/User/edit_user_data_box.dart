// ignore_for_file: must_be_immutable

import 'package:app_stocatge/models/user.dart';
import 'package:app_stocatge/repositories/user_data_repository.dart';
import 'package:app_stocatge/widgets/Suppliers/form_tile.dart';
import 'package:flutter/material.dart';

import '../my_button.dart';

class EditUserDataBox extends StatefulWidget {
  
  EditUserDataBox({super.key, required this.onChanged,});
  
  final Function (BuildContext) onChanged;

  @override
  State<EditUserDataBox> createState() => _EditUserDataBoxState();
}

class _EditUserDataBoxState extends State<EditUserDataBox> {
  UserRepository uR = UserRepository();

  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final fiscalNameController = TextEditingController();
  final nifController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User? user = uR.getUser();
    if (user != null) {
      userNameController.text = user.userName;
      fiscalNameController.text = user.fiscalName;
      nifController.text = user.nif;
      addressController.text = user.address;
      emailController.text = user.email;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "Update My Data ", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
      ),
      insetPadding: const EdgeInsets.only(top: 80, bottom: 40, left: 10, right: 10),
      contentPadding: const EdgeInsets.all(0),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.fact_check_rounded, size: 60, color: Colors.brown[800]),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your Data",
                style: TextStyle(
                  color: Colors.brown[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.brown,
                    width: 3.0,
                  ),
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                        width: 500,
                        height: 350,
                        child: Column(
                          children: [
                            FormTile(dataName: "User Name", controller: userNameController, validator: validateNotEmpty,),
                            FormTile(dataName: "Fiscal Name", controller: fiscalNameController, validator: validateNotEmpty),
                            FormTile(dataName: "NIF", controller: nifController, validator: validateNotEmpty),
                            FormTile(dataName: "Address", controller: addressController, validator: validateNotEmpty),
                            FormTile(dataName: "E-Mail", controller: emailController, validator: validateEmail)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyButton(text: "Save", onPressed: () {
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
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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

  void handleSave() {
    User user = User(
      userName: userNameController.text,
      fiscalName: fiscalNameController.text,
      nif: nifController.text,
      address: addressController.text,
      email: emailController.text, // Asegúrate de guardar el email también
    );
    uR.saveUser(user);
    widget.onChanged(context);
    Navigator.of(context).pop();
    
  }
}
