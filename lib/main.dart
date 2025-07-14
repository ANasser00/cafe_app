import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'ui/views/startup/startup_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  StartupViewModel.resetInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OZ Coffee',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF056780),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF056780),
          primary: const Color(0xFF056780),
          secondary: const Color(0xFFFEEDCB),
        ),
        useMaterial3: true,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.startupView,
      debugShowCheckedModeBanner: false,
    );
  }
}