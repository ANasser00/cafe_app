import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../services/cart_service.dart';

class ItemDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _cartService = locator<CartService>();
  final _snackbarService = locator<SnackbarService>();

  int _quantity = 1;
  bool _isFavorite = false;

  int get quantity => _quantity;
  bool get isFavorite => _isFavorite;

  void incrementQuantity() {
    _quantity++;
    rebuildUi();
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
      rebuildUi();
    }
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    rebuildUi();
  }

  void addToCart(Map<String, dynamic> item) {
    try {
      // Ensure we have valid data
      final String itemId = item['id']?.toString() ?? '';
      final String itemName = item['name']?.toString() ?? 'Unknown Item';
      final double itemPrice = _parsePrice(item['price']);
      
      if (itemId.isEmpty || itemPrice <= 0) {
        _snackbarService.showSnackbar(
          message: 'Invalid item data',
          duration: const Duration(seconds: 2),
        );
        return;
      }

      final cartItem = {
        'id': itemId,
        'name': itemName,
        'price': itemPrice,
        'image': item['image']?.toString() ?? '',
        'description': item['description']?.toString() ?? '',
        'category': item['category']?.toString() ?? '',
        'quantity': _quantity,
        'totalPrice': itemPrice * _quantity,
      };
      
      print('Adding to cart: $cartItem'); // Debug print
      
      _cartService.addToCart(cartItem);
      
      _snackbarService.showSnackbar(
        message: '$itemName added to cart!',
        duration: const Duration(seconds: 2),
      );
      
      goBack();
    } catch (e) {
      print('Error adding to cart: $e'); // Debug print
      _snackbarService.showSnackbar(
        message: 'Error adding item to cart',
        duration: const Duration(seconds: 2),
      );
    }
  }

  double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) {
      return double.tryParse(price) ?? 0.0;
    }
    return 0.0;
  }

  void goBack() {
    _navigationService.back();
  }
}
