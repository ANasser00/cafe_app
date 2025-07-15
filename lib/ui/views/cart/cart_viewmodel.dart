import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../services/cart_service.dart';

class CartViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _cartService = locator<CartService>();
  final _snackbarService = locator<SnackbarService>();

  List<Map<String, dynamic>> get cartItems => _cartService.cartItems;
  double get totalPrice => _cartService.totalPrice;

  void goBack() {
    _navigationService.back();
  }

  void removeFromCart(String itemId) {
    _cartService.removeFromCart(itemId);
    _snackbarService.showSnackbar(
      message: 'Item removed from cart',
      duration: const Duration(seconds: 2),
    );
  }

  void increaseQuantity(String itemId) {
    final item = cartItems.firstWhere((item) => item['id'] == itemId);
    _cartService.updateQuantity(itemId, item['quantity'] + 1);
  }

  void decreaseQuantity(String itemId) {
    final item = cartItems.firstWhere((item) => item['id'] == itemId);
    if (item['quantity'] > 1) {
      _cartService.updateQuantity(itemId, item['quantity'] - 1);
    } else {
      removeFromCart(itemId);
    }
  }

  void clearCart() {
    _cartService.clearCart();
    _snackbarService.showSnackbar(
      message: 'Cart cleared',
      duration: const Duration(seconds: 2),
    );
  }

  void checkout() {
    //  checkout logic 
    _snackbarService.showSnackbar(
      message: 'Checkout functionality coming soon!',
      duration: const Duration(seconds: 2),
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];
}
