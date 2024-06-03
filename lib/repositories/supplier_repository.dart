

import 'package:app_stocatge/repositories/item_repository.dart';
import 'package:hive/hive.dart';

import '../models/supplier.dart';

class SupplierRepository {

  List<Supplier> suppliers = [];
  late Box<Supplier> boxSuppliers;
  late ItemRepository iRepository;

  SupplierRepository(){
    init();
  }
  
  void init() {
    iRepository = ItemRepository();
    boxSuppliers = Hive.box<Supplier>("supplierBox");
    loadData(); 
  }
  void loadData() {
    suppliers = allSuppliersFromDb; 
  }
  
  List<Supplier> get allSuppliersFromDb => boxSuppliers.values.toList();
  
  void addSupplierToDb(Supplier supplier) async {
    await boxSuppliers.add(supplier);
  }
  
  void updateSupplierOnDb(Supplier oldSupplier, Supplier newSupplier) async {
    final supplierKey = boxSuppliers.values.toList().indexOf(oldSupplier);
    if (supplierKey != -1) {
      await boxSuppliers.putAt(supplierKey, newSupplier);
    }
  }

  int get getLength => suppliers.length;
  
  List<Supplier> get allSuppliers => suppliers;
  Supplier getSupplierByName(String name){
    return suppliers.firstWhere((element) => element.name == name);
  }
  Supplier getSupplier(int idx){
    return suppliers.elementAt(idx);
  }
 
  
  void addSupplier(Supplier supplier) {
    suppliers.add(supplier);
    iRepository.items[supplier.getName] = List.empty(growable: true);
  }

  
  void updateSupplier(Supplier oldSupplier, Supplier newSupplier) {
    final index = suppliers.indexOf(oldSupplier);
    print("old ${oldSupplier.name} is ${oldSupplier.isActive}");
    print("new ${oldSupplier.name} is ${newSupplier.isActive}");
    if (index != -1) {
      suppliers[index] = newSupplier;
    }
    print("updated on list --> ${boxSuppliers.get(index)?.active}");
  }

  
  List<Supplier> searchSuppliers(String name) {
    return suppliers.where((supplier) => supplier.name.contains(name)).toList();
  }
 
}