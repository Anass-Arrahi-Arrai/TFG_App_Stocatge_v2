import 'package:app_stocatge/models/user.dart';
import 'package:app_stocatge/repositories/user_data_repository.dart';
import 'package:app_stocatge/widgets/Suppliers/form_tile.dart';
import 'package:app_stocatge/widgets/User/edit_user_data_box.dart';
import 'package:app_stocatge/widgets/my_button.dart';
import 'package:flutter/material.dart';

class UserDataPage extends StatefulWidget {
  UserDataPage({super.key});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  UserRepository uR = UserRepository();

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final fiscalNameController = TextEditingController();
  final nifController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    User? user = uR.getUser();
    if (user != null) {
      userNameController.text = user.userName;
      print(user.fiscalName);
      fiscalNameController.text = user.fiscalName;
      nifController.text = user.nif;
      addressController.text = user.address;
      emailController.text = user.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("User Data",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Center(
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
                        height: 350,
                        child: ListView(
                          children: [
                            FormTile(
                              dataName: "User Name",
                              controller: userNameController,
                              validator: validateNotEmpty,
                              canWrite: true,
                            ),
                            FormTile(
                              dataName: "Fiscal Name",
                              controller: fiscalNameController,
                              validator: validateNotEmpty,
                              canWrite: true,
                            ),
                            FormTile(
                              dataName: "NIF",
                              controller: nifController,
                              validator: validateNotEmpty,
                              canWrite: true,
                            ),
                            FormTile(
                              dataName: "Address",
                              controller: addressController,
                              validator: validateNotEmpty,
                              canWrite: true,
                            ),
                            FormTile(
                              dataName: "E-Mail",
                              controller: emailController,
                              validator: validateEmail,
                              canWrite: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyButton(
                            text: "Modify",
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return EditUserDataBox();
                                },
                              );
                            },
                          ),
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
      email: emailController.text,
    );
    uR.saveUser(user);
  }
}
