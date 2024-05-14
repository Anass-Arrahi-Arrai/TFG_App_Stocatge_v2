// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:app_stocatge/repositories/item_repository.dart';
import 'package:hive/hive.dart';

import '../models/supplier.dart';

class SupplierRepository {

  List<Supplier> _suppliers = [];
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
    _suppliers = allSuppliersFromDb; // Carga los suppliers desde Hive
  }
  // Get all suppliers from db
  List<Supplier> get allSuppliersFromDb => boxSuppliers.values.toList();
  //Add supplier to db
  void addSupplierToDb(Supplier supplier) async {
    await boxSuppliers.add(supplier);
  }
  // Update db supplier 
  void updateSupplierOnDb(Supplier oldSupplier, Supplier newSupplier) async {
    final supplierKey = boxSuppliers.values.toList().indexOf(oldSupplier);
    if (supplierKey != -1) {
      await boxSuppliers.putAt(supplierKey, newSupplier);
    }
  }

  int get getLength => _suppliers.length;
  // Get all suppliers
  List<Supplier> get allSuppliers => _suppliers;
  Supplier getSupplier(int idx){
    return _suppliers.elementAt(idx);
  }
 
  // Add new Supplier
  void addSupplier(Supplier supplier) {
    _suppliers.add(supplier);
    iRepository.items[supplier.getName] = List.empty(growable: true);
  }

  // Update Supplier
  void updateSupplier(Supplier oldSupplier, Supplier newSupplier) {
    final index = _suppliers.indexOf(oldSupplier);
    print("old ${oldSupplier.name} is ${oldSupplier.isActive}");
    print("new ${oldSupplier.name} is ${newSupplier.isActive}");
    if (index != -1) {
      _suppliers[index] = newSupplier;
    }
    print("updated on list --> ${boxSuppliers.get(index)?.active}");
  }

  // Search supplier by name
  List<Supplier> searchSuppliers(String name) {
    return _suppliers.where((supplier) => supplier.name.contains(name)).toList();
  }
 
}