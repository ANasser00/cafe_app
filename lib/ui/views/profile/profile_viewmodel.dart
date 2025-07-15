import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart'; 

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToMembership() {
    _navigationService.navigateToPointsHistoryView(); 
  }
}
