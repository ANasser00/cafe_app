import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class SubscribeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _currentPoints = 2000;
  List<String> _durations = ['60 Days', '30 Days', '14 Days'];
  String _selectedDuration = '60 Days';
  List<Map<String, dynamic>> _allSubscriptionPlans = [];
  List<Map<String, dynamic>> _subscriptionPlans = [];

  int get currentPoints => _currentPoints;
  List<String> get durations => _durations;
  String get selectedDuration => _selectedDuration;
  List<Map<String, dynamic>> get subscriptionPlans => _subscriptionPlans;

  SubscribeViewModel() {
    _loadSubscriptionPlans();
  }

  void _loadSubscriptionPlans() {
    _allSubscriptionPlans = [
      {
        'id': 'plan_1',
        'title': 'Discount up to 20%',
        'subtitle': 'Learn for more info',
        'voucherCount': '100 Voucher',
        'price': 245.00,
        'duration': '60 Days',
        'description': 'If you have subscribed, this voucher will be added automatically to every transaction you make. There are no minimum purchases from certain stores, so you are free to make transactions every day!',
        'renewalInfo': 'Currently, you have to renew manually and choose the payment that we provide if the package has run out. Meanwhile, if you want to cancel, you just need to press the help button in the top right corner of this page and cancel at any time without charge.',
        'bonusPoints': 5,
        'saveAmount': 1200.00,
      },
      {
        'id': 'plan_2',
        'title': 'Discount up to 25%',
        'subtitle': 'Learn for more info',
        'voucherCount': '85 Voucher',
        'price': 180.00,
        'duration': '30 Days',
        'description': 'Enjoy greater discounts on your favorite items for a shorter period.',
        'renewalInfo': 'Automatic renewal is enabled. You can cancel anytime from your profile settings.',
        'bonusPoints': 3,
        'saveAmount': 800.00,
      },
      {
        'id': 'plan_3',
        'title': 'Discount up to BHD2.5',
        'subtitle': 'Learn for more info',
        'voucherCount': '55 Voucher',
        'price': 100.00,
        'duration': '14 Days',
        'description': 'Get a fixed discount on every purchase.',
        'renewalInfo': 'This plan does not auto-renew. You will be notified before expiration.',
        'bonusPoints': 1,
        'saveAmount': 300.00,
      },
      {
        'id': 'plan_4',
        'title': 'Discount up to BHD5',
        'subtitle': 'Learn for more info',
        'voucherCount': '30 Voucher',
        'price': 50.00,
        'duration': '14 Days',
        'description': 'A quick boost to your savings for short trips.',
        'renewalInfo': 'This plan does not auto-renew. You will be notified before expiration.',
        'bonusPoints': 0,
        'saveAmount': 150.00,
      },
      {
        'id': 'plan_5',
        'title': 'Discount up to 45%',
        'subtitle': 'Learn for more info',
        'voucherCount': '75 Voucher',
        'price': 350.00,
        'duration': '60 Days',
        'description': 'Our premium plan for maximum savings!',
        'renewalInfo': 'Automatic renewal is enabled. You can cancel anytime from your profile settings.',
        'bonusPoints': 10,
        'saveAmount': 2000.00,
      },
      {
        'id': 'plan_6',
        'title': 'Discount up to 50%',
        'subtitle': 'Learn for more info',
        'voucherCount': '50 Voucher',
        'price': 280.00,
        'duration': '30 Days',
        'description': 'Unbeatable discounts for a month of treats.',
        'renewalInfo': 'Automatic renewal is enabled. You can cancel anytime from your profile settings.',
        'bonusPoints': 7,
        'saveAmount': 1500.00,
      },
    ];
    
    // Filter plans based on initial selected duration
    _filterPlansByDuration();
    rebuildUi();
  }

  void _filterPlansByDuration() {
    _subscriptionPlans = _allSubscriptionPlans
        .where((plan) => plan['duration'] == _selectedDuration)
        .toList();
  }

  void setSelectedDuration(String duration) {
    _selectedDuration = duration;
    _filterPlansByDuration(); // Filter plans based on selected duration
    rebuildUi();
  }

  void navigateToSubscriptionDetails(Map<String, dynamic> plan) {
    print('SubscribeViewModel: Navigating with plan: $plan'); // Debug print
    
    // Create a clean copy of the plan to ensure all data is properly serialized (same as MenuViewModel)
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
    
    print('SubscribeViewModel: Clean plan data: $cleanPlan'); // Debug print
    
    _navigationService.navigateToSubscriptionDetailsView(plan: cleanPlan);
  }

  void goBack() {
    _navigationService.back();
  }
}
