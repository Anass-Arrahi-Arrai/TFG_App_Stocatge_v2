// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import "package:app_stocatge/models/item.dart";
import "package:app_stocatge/repositories/item_repository.dart";
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
    String address = newSupplierData['name'].toString();

    Supplier newSupplier = Supplier(name: name, nif: nif, address: address, active: true);
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
    String address = newSupplierData['name'].toString();

    Supplier newSupplier = Supplier(name: name, nif: nif, address: address, active: true);
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
        return NewSupplierBox(
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
  void setInactive(int index) {
    Supplier oldSupplier = repository.allSuppliers.elementAt(index);
    Supplier newSupplier = Supplier(name: oldSupplier.name, nif: oldSupplier.nif, address: oldSupplier.address, active: false);
    repository.updateSupplierOnDb(oldSupplier, newSupplier);
    setState(() {
      repository.updateSupplier(oldSupplier, newSupplier);
    });
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
