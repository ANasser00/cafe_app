import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class SubscribePaymentViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool _usePoints = false;

  bool get usePoints => _usePoints;

  void toggleUsePoints(bool value) {
    _usePoints = value;
    rebuildUi();
  }

  void goBack() {
    _navigationService.back();
  }
}
