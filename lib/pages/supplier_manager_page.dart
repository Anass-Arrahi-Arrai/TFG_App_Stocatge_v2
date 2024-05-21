// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import "package:app_stocatge/models/item.dart";
import "package:app_stocatge/repositories/item_repository.dart";
import "package:app_stocatge/widgets/Suppliers/modify_supplier_box.dart";
import "package:app_stocatge/widgets/Suppliers/new_supplier_box.dart";
import "package:app_stocatge/widgets/Suppliers/supplier_tile.dart";
import "package:app_stocatge/widgets/Suppliers/new_item_box.dart";
import "package:flutter/material.dart";
import '../models/supplier.dart';
import '../repositories/supplier_repository.dart';

class SupplierManager extends StatefulWidget {
  
  const SupplierManager({super.key});
  
  @override
  State<SupplierManager> createState() => _SupplierManagerState();
}

class _SupplierManagerState extends State<SupplierManager> {
  
  final SupplierRepository repository = SupplierRepository();
  final ItemRepository itemRepo = ItemRepository();

  void getNewSuplierToReplace(Map<String, String> newSupplierData, int index){

    String name = newSupplierData['name'].toString();
    String nif = newSupplierData['nif'].toString();
    String address = newSupplierData['address'].toString();
    String email = newSupplierData['email'].toString();
    String number = newSupplierData['num'].toString();

    Supplier newSupplier = Supplier(name: name, nif: nif, address: address, email: email, phoneNumber: number, active: true);
    Supplier oldSupplier = repository.allSuppliers.elementAt(index);
    repository.updateSupplierOnDb(oldSupplier, newSupplier);
    setState(() {
      repository.updateSupplier(oldSupplier, newSupplier);
    });
    Navigator.of(context).pop();
  }

  void saveSupplier(Map<String, String> newSupplierData){

    String name = newSupplierData['name'].toString();
    String nif = newSupplierData['nif'].toString();
    String address = newSupplierData['adress'].toString();
    String email = newSupplierData['email'].toString();
    String number = newSupplierData['num'].toString();

    Supplier newSupplier = Supplier(name: name, nif: nif, address: address, email: email, phoneNumber: number, active: true);
    repository.addSupplierToDb(newSupplier);
    setState(() {
      repository.addSupplier(newSupplier);
    });
    Navigator.of(context).pop();
  }

  void addItemToSupplier(int index, Map<String, String> newItemData) {
    String name = newItemData['name'].toString();
    double price = double.parse(newItemData['price'].toString());
    String format = newItemData['format'].toString();
    Supplier supplier = repository.allSuppliers.elementAt(index);
    Item newItem = Item(productName: name, unitPrice: price, supplierItem: supplier.name, itemFormat: format);
    setState(() {
      itemRepo.setNewItem(supplier.getName,newItem);//repository.allSuppliers.elementAt(index).getItems();
    });
    itemRepo.printAllItems();
    Navigator.of(context).pop();
  }
  void createNewItem(int index){
     showDialog(
      context: context, 
      builder: (context) {
        return NewItemBox(
          onSave: (newItemData) => addItemToSupplier(index, newItemData),
          supplier: index,
        );
      },
      );
  }
  void modifySup(int index) {
    showDialog(
      context: context, 
      builder: (context) {
        return ModifySupBox(
          supplier: repository.allSuppliers.elementAt(index),
          onSave: (newSupplierData) => getNewSuplierToReplace(newSupplierData, index),
        );
      },
      );
  }
  void createNewSup() {
      showDialog(
      context: context, 
      builder: (context) {
        return NewSupplierBox(
          onSave: (newSupplierData) => saveSupplier(newSupplierData),
        );
      },
      );
    }
  Future<bool> showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Deletion',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red[700],
            ),
            ),
          content: Text('Are you sure you want to delete this Supplier? This action is irreversible and cannot be undone.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                ),
              ),
            ],
          );
        },
      ) ?? false; // Return false if the dialog is dismissed by tapping outside
  }
  void setInactive(int index) async{
    bool confirm = await showConfirmationDialog(context);
    if(confirm){
      Supplier oldSupplier = repository.allSuppliers.elementAt(index);
      Supplier newSupplier = Supplier(name: oldSupplier.name, nif: oldSupplier.nif, address: oldSupplier.address, active: false);
      repository.updateSupplierOnDb(oldSupplier, newSupplier);
      
      setState(() {
        repository.updateSupplier(oldSupplier, newSupplier);
      });
    }
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Supplier Page",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.brown[300]
                ),
                child: ListView.builder(
                  itemCount: repository.getLength,
                  itemBuilder: (context, index) {
                    return SupplierTile(
                      supplierName: repository.allSuppliers[index].getName,
                      active: repository.allSuppliers[index].isActive,
                      setInactive: (context) => setInactive(index),
                      modifySupplier: (context) => modifySup(index),
                      addItem: (context) => createNewItem(index),
                    );
                  },
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 80),
              child: Text(
                "Add Supplier",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[900]
                ),
                ),
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewSup(),
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      )
    );
    
  }
  
 
}
