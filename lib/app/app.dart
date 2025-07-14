import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/promo/promo_view.dart';
import '../ui/views/profile/profile_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/main_navigation/main_navigation_view.dart';
import '../ui/views/menu/menu_view.dart';
import '../ui/views/item_details/item_details_view.dart';
import '../ui/views/points_history/points_history_view.dart';
import '../ui/views/subscribe/subscribe_view.dart';
import '../ui/views/subscription_details/subscription_details_view.dart';
import '../ui/views/subscribe_payment/subscribe_payment_view.dart';
import '../services/cart_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: MainNavigationView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: PromoView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: MenuView),
    MaterialRoute(page: ItemDetailsView),
    MaterialRoute(page: PointsHistoryView),
    MaterialRoute(page: SubscribeView),
    MaterialRoute(page: SubscriptionDetailsView),
    MaterialRoute(page: SubscribePaymentView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: CartService),
    // Removed HomeViewModel from here - ViewModels should not be singletons
  ],
)
class App {}
