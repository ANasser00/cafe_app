import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class SubscriptionDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  bool _isLoading = false;
  bool _isSubscribed = false;

  bool get isLoading => _isLoading;
  bool get isSubscribed => _isSubscribed;

  void navigateToSubscribePayment(Map<String, dynamic> plan) {
    try {
      // Ensure we have valid plan data
      final String planId = plan['id']?.toString() ?? '';
      final String planTitle = plan['title']?.toString() ?? 'Unknown Plan';
      final double planPrice = _parsePrice(plan['price']);
      
      if (planId.isEmpty || planPrice <= 0) {
        _snackbarService.showSnackbar(
          message: 'Invalid plan data',
          duration: const Duration(seconds: 2),
        );
        return;
      }

      print('SubscriptionDetailsViewModel: Navigating to payment with plan: $plan'); // Debug print
      
      final cleanPlan = {
        'id': plan['id']?.toString() ?? '',
        'title': plan['title']?.toString() ?? 'Unknown Plan',
        'subtitle': plan['subtitle']?.toString() ?? '',
        'voucherCount': plan['voucherCount']?.toString() ?? '0 Voucher',
        'price': plan['price'] ?? 0.0,
        'duration': plan['duration']?.toString() ?? 'N/A',
        'description': plan['description']?.toString() ?? 'No description available.',
        'renewalInfo': plan['renewalInfo']?.toString() ?? 'No renewal information available.',
        'bonusPoints': plan['bonusPoints'] ?? 0,
        'saveAmount': plan['saveAmount'] ?? 0.0,
      };
      
      print('SubscriptionDetailsViewModel: Clean plan data: $cleanPlan'); // Debug print
      
      // Use the proper generated navigation method
      _navigationService.navigateToSubscribePaymentView(plan: cleanPlan);
      
    } catch (e) {
      print('Error navigating to payment: $e'); // Debug print
      _snackbarService.showSnackbar(
        message: 'Error processing subscription',
        duration: const Duration(seconds: 2),
      );
    }
  }

  void subscribeToPlan(Map<String, dynamic> plan) async {
    try {
      _isLoading = true;
      rebuildUi();

      // Validate plan data
      final String planId = plan['id']?.toString() ?? '';
      final String planTitle = plan['title']?.toString() ?? 'Unknown Plan';
      final double planPrice = _parsePrice(plan['price']);
      
      if (planId.isEmpty || planPrice <= 0) {
        _snackbarService.showSnackbar(
          message: 'Invalid plan data',
          duration: const Duration(seconds: 2),
        );
        return;
      }

      print('Subscribing to plan: $plan'); // Debug print
      
      // await _subscriptionService.subscribe(plan);
      
      // Simulate subscription process
      await Future.delayed(const Duration(seconds: 2));
      
      _isSubscribed = true;
      
      _snackbarService.showSnackbar(
        message: 'Successfully subscribed to $planTitle!',
        duration: const Duration(seconds: 2),
      );
      
      goBack();
      
    } catch (e) {
      print('Error subscribing to plan: $e'); // Debug print
      _snackbarService.showSnackbar(
        message: 'Error subscribing to plan',
        duration: const Duration(seconds: 2),
      );
    } finally {
      _isLoading = false;
      rebuildUi();
    }
  }

  // Helper method to parse price safely
  double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) {
      return double.tryParse(price) ?? 0.0;
    }
    return 0.0;
  }

  // Helper method to parse integer values safely
  int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  void goBack() {
    _navigationService.back();
  }
}
