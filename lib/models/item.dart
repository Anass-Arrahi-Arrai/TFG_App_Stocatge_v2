class Item {

  String productId;
  String productName;
  double unitPrice;

  Item({
    required this.productId,
    required this.productName,
    required this.unitPrice,
  });

  // Método para actualizar la cantidad de un producto

  @override
  String toString() {
    return 'Item {productId: $productId, productName: $productName, unitPrice: $unitPrice}';
  }
  
}