import 'package:stacked/stacked.dart';

class CartService with ListenableServiceMixin {
  List<Map<String, dynamic>> _cartItems = [];
  
  List<Map<String, dynamic>> get cartItems => List.unmodifiable(_cartItems);
  
  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      final double itemTotal = _parseDouble(item['totalPrice']);
      total += itemTotal;
    }
    return total;
  }
  
  void addToCart(Map<String, dynamic> item) {
    try {
      print('CartService: Adding item: $item'); // Debug print
      
      final String itemId = item['id']?.toString() ?? '';
      if (itemId.isEmpty) {
        print('CartService: Invalid item ID');
        return;
      }

      // Check if item already exists in cart
      final existingIndex = _cartItems.indexWhere((cartItem) => cartItem['id'] == itemId);
      
      if (existingIndex != -1) {
        // Update quantity if item exists
        final int currentQuantity = _parseInt(_cartItems[existingIndex]['quantity']);
        final int newQuantity = _parseInt(item['quantity']);
        final double price = _parseDouble(_cartItems[existingIndex]['price']);
        
        _cartItems[existingIndex]['quantity'] = currentQuantity + newQuantity;
        _cartItems[existingIndex]['totalPrice'] = price * (currentQuantity + newQuantity);
      } else {
        // Add new item to cart
        final Map<String, dynamic> cartItem = Map<String, dynamic>.from(item);
        _cartItems.add(cartItem);
      }
      
      print('CartService: Cart now has ${_cartItems.length} items'); // Debug print
      notifyListeners();
    } catch (e) {
      print('CartService: Error adding to cart: $e');
    }
  }
  
  void removeFromCart(String itemId) {
    _cartItems.removeWhere((item) => item['id'] == itemId);
    notifyListeners();
  }
  
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
  
  void updateQuantity(String itemId, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item['id'] == itemId);
    if (index != -1) {
      if (newQuantity <= 0) {
        removeFromCart(itemId);
      } else {
        final double price = _parseDouble(_cartItems[index]['price']);
        _cartItems[index]['quantity'] = newQuantity;
        _cartItems[index]['totalPrice'] = price * newQuantity;
        notifyListeners();
      }
    }
  }

  // Helper methods for safe parsing
  double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}
