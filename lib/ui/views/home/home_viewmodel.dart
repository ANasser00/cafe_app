import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _currentAdIndex = 0;
  final List<Map<String, String>> _ads = [
    {'id': '1', 'image': 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=400'},
    {'id': '2', 'image': 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=400'},
    {'id': '3', 'image': 'https://images.pexels.com/photos/2253643/pexels-photo-2253643.jpeg?auto=compress&cs=tinysrgb&w=400'},
  ];
  final List<Map<String, String>> _nearbyPlaces = [
    {
      'name': 'Goodtime Cafe 28',
      'location': 'Jl. ZA Pagar Alam, No. 43',
      'status': 'Open',
      'distance': '2.10 km',
      'image': 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=400'
    },
    {
      'name': 'Arabica Cafe 123',
      'location': 'Jl. ZA Pagar Alam, Bandar Lamp...',
      'status': 'Close',
      'distance': '4.80 km',
      'image': 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=400'
    },
    {
      'name': 'Coffee Corner',
      'location': 'Jl. Sudirman, No. 15',
      'status': 'Open',
      'distance': '1.50 km',
      'image': 'https://images.pexels.com/photos/2253643/pexels-photo-2253643.jpeg?auto=compress&cs=tinysrgb&w=400'
    },
    {
      'name': 'Brew & Bean',
      'location': 'Jl. Ahmad Yani, No. 22',
      'status': 'Open',
      'distance': '3.20 km',
      'image': 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=400'
    },
  ];

  int get currentAdIndex => _currentAdIndex;
  List<Map<String, String>> get ads => _ads;
  List<Map<String, String>> get nearbyPlaces => _nearbyPlaces;

  void setAdIndex(int index) {
    _currentAdIndex = index;
    rebuildUi();
  }

  void navigateToProfile() {
    print('HomeViewModel: Navigating to profile'); // Debug print
    _navigationService.navigateToProfileView();
  }

  void navigateToSubscribe() {
    print('HomeViewModel: Navigating to subscribe'); // Debug print
    _navigationService.navigateToSubscribeView();
  }

  void handlePickup() {
    print('HomeViewModel: Pickup button pressed'); // Debug print
    // Add pickup functionality here
  }

  void handleDelivery() {
    print('HomeViewModel: Delivery button pressed'); // Debug print
    // Add delivery functionality here
  }

  void handleMore() {
    print('HomeViewModel: More button pressed'); // Debug print
    // Add more functionality here
  }
}
