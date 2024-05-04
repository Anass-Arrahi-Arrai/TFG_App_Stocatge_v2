class OrderItem {

  int productId;
  String productName;
  double unitPrice;
  int quantity;
  double get totalPrice => unitPrice * quantity;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.quantity,
  });

  // Método para actualizar la cantidad de un producto
  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
  }

  @override
  String toString() {
    return 'OrderItem{productId: $productId, productName: $productName, unitPrice: $unitPrice, quantity: $quantity, totalPrice: $totalPrice}';
  }
  
}