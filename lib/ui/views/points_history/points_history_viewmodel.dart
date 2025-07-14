import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class PointsHistoryViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _currentPoints = 2000;
  List<Map<String, dynamic>> _pointsHistory = [];

  int get currentPoints => _currentPoints;
  List<Map<String, dynamic>> get pointsHistory => _pointsHistory;

  PointsHistoryViewModel() {
    _loadPointsHistory();
  }

  void _loadPointsHistory() {
    _pointsHistory = [
      {'type': 'date', 'value': '13 August 2024'},
      {'type': 'transaction', 'description': 'Purchase #26998220120', 'points': '+10 pts'},
      {'type': 'transaction', 'description': 'Purchase #26998220120', 'points': '+10 pts'},
      {'type': 'transaction', 'description': 'Exchange Goodtime Cafe Vouchers', 'points': '-80 pts'},
      {'type': 'transaction', 'description': 'Purchase #26998220120', 'points': '+10 pts'},
      {'type': 'transaction', 'description': 'Purchase #26998220120', 'points': '+10 pts'},
      {'type': 'date', 'value': '21 July 2024'},
      {'type': 'transaction', 'description': 'Purchase #26998220120', 'points': '+10 pts'},
      {'type': 'transaction', 'description': 'Purchase #26998220120', 'points': '+10 pts'},
      {'type': 'transaction', 'description': 'Exchange Goodtime Cafe Vouchers', 'points': '-80 pts'},
    ];
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }
}
