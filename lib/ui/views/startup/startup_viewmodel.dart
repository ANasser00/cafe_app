import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  
  static bool _hasInitialized = false; 
  
  StartupViewModel() {
    // Reset on web refresh
    if (identical(0, 0.0)) { 
      _hasInitialized = false;
    }
  }
  
  // Public method to be called from the View
  Future<void> initialize() async {
    if (_hasInitialized) return;
    _hasInitialized = true;
    
    // Add a minimum display time to ensure logo is visible
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Add your app initialization logic here
    await _performStartupTasks();
    
    // Ensure minimum 2 seconds display time
    await Future.delayed(const Duration(seconds: 2));
    
    // Clear navigation stack and navigate to onboarding
    await _navigationService.clearStackAndShow(Routes.onboardingView);
  }
  
  // Method to reset initialization state (call this on app restart)
  static void resetInitialization() {
    _hasInitialized = false;
  }
  
  Future<void> _performStartupTasks() async {
    // Add any startup initialization here:
    // - Check authentication status
    // - Load app configuration
    // - Initialize services
    // - etc.
    
    // Simulate some startup work
    await Future.delayed(const Duration(milliseconds: 300));
  }
}