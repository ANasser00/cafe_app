// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cafe_app/ui/views/home/home_view.dart' as _i4;
import 'package:cafe_app/ui/views/main_navigation/main_navigation_view.dart'
    as _i3;
import 'package:cafe_app/ui/views/onboarding/onboarding_view.dart' as _i8;
import 'package:cafe_app/ui/views/profile/profile_view.dart' as _i7;
import 'package:cafe_app/ui/views/promo/promo_view.dart' as _i5;
import 'package:cafe_app/ui/views/startup/startup_view.dart' as _i2;
import 'package:cafe_app/ui/views/menu/menu_view.dart' as _i6;
import 'package:cafe_app/ui/views/cart/cart_view.dart' as _i9;
import 'package:cafe_app/ui/views/item_details/item_details_view.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;
import 'package:cafe_app/ui/views/points_history/points_history_view.dart' as _i13;
import 'package:cafe_app/ui/views/subscribe/subscribe_view.dart' as _i14;
import 'package:cafe_app/ui/views/subscription_details/subscription_details_view.dart' as _i15;
import 'package:cafe_app/ui/views/subscribe_payment/subscribe_payment_view.dart' as _i16;

class Routes {
  static const startupView = '/startup-view';
  static const mainNavigationView = '/main-navigation-view';
  static const homeView = '/home-view';
  static const promoView = '/promo-view';
  static const profileView = '/profile-view';
  static const onboardingView = '/onboarding-view';
  static const cartView = '/cart-view';
  static const menuView = '/menu-view';
  static const itemDetailsView = '/item-details-view';
  static const pointsHistoryView = '/points-history-view'; 
  static const subscribeView = '/subscribe-view'; 
  static const subscriptionDetailsView = '/subscription-details-view'; 
  static const subscribePaymentView = '/subscribe-payment-view'; 

  static const all = <String>{
    startupView,
    mainNavigationView,
    homeView,
    promoView,
    profileView,
    onboardingView,
    cartView,
    menuView,
    itemDetailsView,
    pointsHistoryView,
    subscribeView,
    subscriptionDetailsView,
    subscribePaymentView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.mainNavigationView,
      page: _i3.MainNavigationView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i4.HomeView,
    ),
    _i1.RouteDef(
      Routes.promoView,
      page: _i5.PromoView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i9.CartView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i7.ProfileView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i8.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.menuView,
      page: _i6.MenuView,
    ),
    _i1.RouteDef(
      Routes.itemDetailsView,
      page: _i10.ItemDetailsView,
    ),
    _i1.RouteDef(
      Routes.pointsHistoryView,
      page: _i13.PointsHistoryView,
    ),
    _i1.RouteDef(
      Routes.subscribeView,
      page: _i14.SubscribeView,
    ),
    _i1.RouteDef(
      Routes.subscriptionDetailsView,
      page: _i15.SubscriptionDetailsView,
    ),
    _i1.RouteDef(
      Routes.subscribePaymentView,
      page: _i16.SubscribePaymentView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.MainNavigationView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.MainNavigationView(),
        settings: data,
      );
    },
    _i4.HomeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.HomeView(),
        settings: data,
      );
    },
    _i5.PromoView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PromoView(),
        settings: data,
      );
    },
    _i9.CartView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.CartView(),
        settings: data,
      );
    },
    _i7.ProfileView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfileView(),
        settings: data,
      );
    },
    _i8.OnboardingView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.OnboardingView(),
        settings: data,
      );
    },
    _i6.MenuView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.MenuView(),
        settings: data,
      );
    },
    _i10.ItemDetailsView: (data) {
      print('Router: RouteSettings arguments: ${data.arguments}');
      print('Router: RouteSettings name: ${data.name}');
      
      Map<String, dynamic> item = {};
      
      // Try to get from arguments first
      if (data.arguments != null) {
        if (data.arguments is Map<String, dynamic>) {
          item = data.arguments as Map<String, dynamic>;
          print('Router: Got item from arguments: $item');
        } else {
          print('Router: Arguments is not a Map<String, dynamic>, it is: ${data.arguments.runtimeType}');
        }
      }
      
      // If arguments failed, try to parse from route name/parameters
      if (item.isEmpty && data.name != null) {
        final uri = Uri.parse(data.name!);
        if (uri.queryParameters.isNotEmpty) {
          print('Router: Found query parameters: ${uri.queryParameters}');
          item = {
            'id': uri.queryParameters['id'] ?? '',
            'name': uri.queryParameters['name'] ?? '',
            'price': double.tryParse(uri.queryParameters['price'] ?? '0.0') ?? 0.0,
            'image': uri.queryParameters['image'] ?? '',
            'description': uri.queryParameters['description'] ?? '',
            'category': uri.queryParameters['category'] ?? '',
            'ingredients': uri.queryParameters['ingredients']?.split(',') ?? [],
            'calories': int.tryParse(uri.queryParameters['calories'] ?? '0') ?? 0,
            'size': uri.queryParameters['size'] ?? '',
          };
          print('Router: Parsed item from parameters: $item');
        }
      }
      
      if (item.isEmpty) {
        print('Router: No item data found, using empty item');
      }
      
      print('Router: Final item to pass to view: $item');
      
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ItemDetailsView(item: item),
        settings: data,
      );
    },
    _i13.PointsHistoryView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.PointsHistoryView(),
        settings: data,
      );
    },
    _i14.SubscribeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.SubscribeView(),
        settings: data,
      );
    },
    _i15.SubscriptionDetailsView: (data) {
      print('Router: SubscriptionDetailsView RouteSettings arguments: ${data.arguments}');
      print('Router: SubscriptionDetailsView RouteSettings name: ${data.name}');
      
      Map<String, dynamic> plan = {};
      
      // Try to get from arguments first
      if (data.arguments != null) {
        if (data.arguments is Map<String, dynamic>) {
          plan = data.arguments as Map<String, dynamic>;
          print('Router: Got plan directly from arguments: $plan');
        } else {
          print('Router: Arguments is not a Map<String, dynamic>, it is: ${data.arguments.runtimeType}');
        }
      }
      
      // If arguments failed, try to parse from route name/parameters
      if (plan.isEmpty && data.name != null) {
        final uri = Uri.parse(data.name!);
        if (uri.queryParameters.isNotEmpty) {
          print('Router: Found query parameters: ${uri.queryParameters}');
          plan = {
            'id': uri.queryParameters['id'] ?? '',
            'title': uri.queryParameters['title'] ?? '',
            'subtitle': uri.queryParameters['subtitle'] ?? '',
            'voucherCount': uri.queryParameters['voucherCount'] ?? '0 Voucher',
            'price': double.tryParse(uri.queryParameters['price'] ?? '0.0') ?? 0.0,
            'duration': uri.queryParameters['duration'] ?? '',
            'description': uri.queryParameters['description'] ?? '',
            'renewalInfo': uri.queryParameters['renewalInfo'] ?? '',
            'bonusPoints': int.tryParse(uri.queryParameters['bonusPoints'] ?? '0') ?? 0,
            'saveAmount': double.tryParse(uri.queryParameters['saveAmount'] ?? '0.0') ?? 0.0,
          };
          print('Router: Parsed plan from parameters: $plan');
        }
      }
      
      if (plan.isEmpty) {
        print('Router: No plan data found, using empty plan');
      }
      
      print('Router: Final plan to pass to view: $plan');
      
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.SubscriptionDetailsView(plan: plan),
        settings: data,
      );
    },
    _i16.SubscribePaymentView: (data) {
      print('Router: SubscribePaymentView RouteSettings arguments: ${data.arguments}');
      print('Router: SubscribePaymentView RouteSettings name: ${data.name}');

      Map<String, dynamic> plan = {};

      // Try to get from arguments first
      if (data.arguments != null) {
        if (data.arguments is Map<String, dynamic>) {
          plan = data.arguments as Map<String, dynamic>;
          print('Router: Got plan directly from arguments: $plan');
        } else {
          print('Router: Arguments is not a Map<String, dynamic>, it is: ${data.arguments.runtimeType}');
        }
      }

      // If arguments failed, try to parse from route name/parameters
      if (plan.isEmpty && data.name != null) {
        final uri = Uri.parse(data.name!);
        if (uri.queryParameters.isNotEmpty) {
          print('Router: Found query parameters: ${uri.queryParameters}');
          plan = {
            'id': uri.queryParameters['id'] ?? '',
            'title': uri.queryParameters['title'] ?? '',
            'subtitle': uri.queryParameters['subtitle'] ?? '',
            'voucherCount': uri.queryParameters['voucherCount'] ?? '0 Voucher',
            'price': double.tryParse(uri.queryParameters['price'] ?? '0.0') ?? 0.0,
            'duration': uri.queryParameters['duration'] ?? '',
            'description': uri.queryParameters['description'] ?? '',
            'renewalInfo': uri.queryParameters['renewalInfo'] ?? '',
            'bonusPoints': int.tryParse(uri.queryParameters['bonusPoints'] ?? '0') ?? 0,
            'saveAmount': double.tryParse(uri.queryParameters['saveAmount'] ?? '0.0') ?? 0.0,
          };
          print('Router: Parsed plan from parameters: $plan');
        }
      }
      
      if (plan.isEmpty) {
        print('Router: No plan data found, using empty plan');
      }

      print('Router: Final plan to pass to payment view: $plan');

      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.SubscribePaymentView(plan: plan),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainNavigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPromoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.promoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.menuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToItemDetailsView({
    required Map<String, dynamic> item,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    print('NavigationService: Navigating with item: $item');
    
    // Convert item data to string parameters
    final itemParameters = <String, String>{
      'id': item['id']?.toString() ?? '',
      'name': item['name']?.toString() ?? '',
      'price': item['price']?.toString() ?? '0.0',
      'image': item['image']?.toString() ?? '',
      'description': item['description']?.toString() ?? '',
      'category': item['category']?.toString() ?? '',
      'ingredients': item['ingredients']?.join(',') ?? '',
      'calories': item['calories']?.toString() ?? '0',
      'size': item['size']?.toString() ?? '',
    };
    
    // Merge with existing parameters
    final allParameters = <String, String>{
      ...?parameters,
      ...itemParameters,
    };
    
    return navigateTo<dynamic>(Routes.itemDetailsView,
        arguments: item,  
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: allParameters,  
        transition: transition);
  }

  Future<dynamic> navigateToPointsHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pointsHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSubscribeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.subscribeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSubscriptionDetailsView({
    required Map<String, dynamic> plan,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    print('NavigationService: Navigating to subscription details with plan: $plan');
    
    // Convert plan data to string parameters as backup
    final planParameters = <String, String>{
      'id': plan['id']?.toString() ?? '',
      'title': plan['title']?.toString() ?? '',
      'subtitle': plan['subtitle']?.toString() ?? '',
      'voucherCount': plan['voucherCount']?.toString() ?? '',
      'price': plan['price']?.toString() ?? '0.0',
      'duration': plan['duration']?.toString() ?? '',
      'description': plan['description']?.toString() ?? '',
      'renewalInfo': plan['renewalInfo']?.toString() ?? '',
      'bonusPoints': plan['bonusPoints']?.toString() ?? '0',
      'saveAmount': plan['saveAmount']?.toString() ?? '0.0',
    };
    
    // Merge with existing parameters
    final allParameters = <String, String>{
      ...?parameters,
      ...planParameters,
    };
    
    return navigateTo<dynamic>(Routes.subscriptionDetailsView,
        arguments: plan,  // Primary method: pass the plan directly as arguments
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: allParameters,  // Backup method: also pass as parameters
        transition: transition);
  }

  Future<dynamic> navigateToSubscribePaymentView({
    required Map<String, dynamic> plan,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    print('NavigationService: Navigating to payment with plan: $plan');
    
    // Convert plan data to string parameters as backup
    final planParameters = <String, String>{
      'id': plan['id']?.toString() ?? '',
      'title': plan['title']?.toString() ?? '',
      'subtitle': plan['subtitle']?.toString() ?? '',
      'voucherCount': plan['voucherCount']?.toString() ?? '',
      'price': plan['price']?.toString() ?? '0.0',
      'duration': plan['duration']?.toString() ?? '',
      'description': plan['description']?.toString() ?? '',
      'renewalInfo': plan['renewalInfo']?.toString() ?? '',
      'bonusPoints': plan['bonusPoints']?.toString() ?? '0',
      'saveAmount': plan['saveAmount']?.toString() ?? '0.0',
    };

    // Merge with existing parameters
    final allParameters = <String, String>{
      ...?parameters,
      ...planParameters,
    };
    
    return navigateTo<dynamic>(Routes.subscribePaymentView,
        arguments: plan, // Primary method: pass the plan directly as arguments
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: allParameters, // Backup method: also pass as parameters
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainNavigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPromoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.promoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPointsHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pointsHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSubscribeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.subscribeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSubscriptionDetailsView({
    required Map<String, dynamic> plan,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.subscriptionDetailsView,
        arguments: plan,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSubscribePaymentView({
    required Map<String, dynamic> plan,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.subscribePaymentView,
        arguments: plan,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
