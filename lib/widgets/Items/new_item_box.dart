import 'package:app_stocatge/repositories/food_format_types.dart';
import 'package:app_stocatge/repositories/item_repository.dart';
import 'package:app_stocatge/widgets/Items/item_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_stocatge/repositories/supplier_repository.dart';
import 'package:app_stocatge/widgets/Suppliers/form_tile.dart';
import 'package:app_stocatge/widgets/Suppliers/form_tile_drop_down.dart';
import 'package:app_stocatge/widgets/my_button.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../models/item.dart';

class NewItemBox extends StatefulWidget {
  final Function(Map<String, String>) onSave;
  final int supplier;

  NewItemBox({Key? key, required this.onSave, required this.supplier})
      : super(key: key);

  @override
  State<NewItemBox> createState() => _NewItemBoxState();
}

class _NewItemBoxState extends State<NewItemBox> {
  final GlobalKey<FormTileDropDownState> _dropdownKeyType =
      GlobalKey<FormTileDropDownState>();
  final GlobalKey<FormTileDropDownState> _dropdownKeyUOM =
      GlobalKey<FormTileDropDownState>();
  final GlobalKey<FormTileDropDownState> _dropdownKeyFormat =
      GlobalKey<FormTileDropDownState>(); 
  final typeController = TextEditingController();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final lotQController = TextEditingController();

  final SupplierRepository sR = SupplierRepository();
  final ItemRepository iR = ItemRepository();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var supplierName =sR.getSupplier(widget.supplier).name;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "New Item for $supplierName",
        style: TextStyle(
          fontSize:19,
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
      ),
      insetPadding: const EdgeInsets.only(top: 65, bottom: 65),
      contentPadding: const EdgeInsets.only(top:10, left: 10, right: 10),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.fastfood, size: 60, color: Colors.brown[800]),
      backgroundColor: Colors.brown[200],
      content: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Current Items",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
            ),
            Container(
              width: 375,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10),
              ),
              child: iR.getItems(supplierName).isNotEmpty? 
              ListView.builder(
                itemCount: iR.getItems(supplierName).length,
                itemBuilder: (context, index) {
                  Item item = iR.getItems(supplierName)[index];
                  return ItemTile(name: item.productName, format: item.itemFormat!, quant: item.lotQuantity, uom: item.uom, price: item.unitPrice);
                  
                  },
                ) :
                const Center(
                  child: Text(
                      "NO ITEMS YET",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerLeft ,
              child: Text(
                "New item form",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                width: 375,
                height: 435,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            FormTileDropDown(
                              key: _dropdownKeyType,
                              dataName: 'Type',
                              options: FoodAndFormatTypes.types.keys.toList(),
                              validator: validateNotEmpty,
                            ),
                            FormTile(
                              dataName: "Product Name",
                              controller: nameController,
                              validator: validateNotEmpty,
                            ),
                            FormTile(
                              dataName: "Price",
                              controller: priceController,
                              validator: validateNotEmptyAndNegative,
                              isNumber: true,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: FormTile(
                                    dataName: "Lot\nQuantity",
                                    controller: lotQController,
                                    validator: validateNotEmptyAndNegative,
                                    isNumber: true,
                                  ),
                                ),
                              ],
                            ),
                            FormTileDropDown(
                                  key: _dropdownKeyFormat,
                                  dataName: 'Format',
                                  options: FoodAndFormatTypes.format,
                                  validator: validateNotEmpty,
                                ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyButton(
                              text: "Save",
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  handleSave();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Please correct the errors')),
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            MyButton(
                              text: "Cancel",
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
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

  void handleSave() {
    final selecteType = _dropdownKeyType.currentState?.selectedOption;
    final selectedFormat = _dropdownKeyFormat.currentState?.selectedOption;
    Map<String, String> newItemData = {
      'name': nameController.text,
      'type': selecteType ?? '',
      'price': priceController.text,
      'format': selectedFormat ?? '',
      'uom': FoodAndFormatTypes.types[selecteType] ?? '',
      'lotQuantity': lotQController.text
    };
    widget.onSave(newItemData);
  }

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }
  String? validateNotEmptyAndNegative(String? value) {
    double? numb  = double.tryParse(value!);
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (numb == null || numb == 0) {
      return 'Value has\nto be> 0';
    }
    return null;
  }
}
