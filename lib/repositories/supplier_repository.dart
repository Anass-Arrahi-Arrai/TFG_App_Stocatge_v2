// ignore_for_file: use_function_type_syntax_for_parameters

import '../models/supplier.dart';

class SupplierRepository {
// La lista interna de proveedores. Podría ser reemplazada con una base de datos real en el futuro.
  final List<Supplier> _suppliers = [];

  // Obtener tamaño lista
  int get getLength => _suppliers.length;
  // Obtener todos los proveedores.
  List<Supplier> get allSuppliers => _suppliers;

  // Añadir un nuevo proveedor.
  void addSupplier(Supplier supplier) {
    _suppliers.add(supplier);
  }

  // Eliminar un proveedor.
  void removeSupplier(Supplier supplier) {
    _suppliers.remove(supplier);
  }

  // Actualizar un proveedor.
  void updateSupplier(Supplier oldSupplier, Supplier newSupplier) {
    final index = _suppliers.indexOf(oldSupplier);
    if (index != -1) {
      _suppliers[index] = newSupplier;
    }
  }

  // Buscar proveedores por algún criterio, como el nombre.
  List<Supplier> searchSuppliers(String query) {
    return _suppliers.where((supplier) => supplier.name.contains(query)).toList();
  }
 
}