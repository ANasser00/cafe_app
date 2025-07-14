import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white, // Add explicit background color
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Add fade-in animation for better UX
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: SvgPicture.asset(
                'assets/icons/Oz_logo.svg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              color: Color(0xFF056780),
              strokeWidth: 3.0,
            ),
            const SizedBox(height: 16),
            const Text(
              'Loading...',
              style: TextStyle(
                color: Color(0xFF056780),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
  
  @override
  bool get reactive => true;
  
  @override
  void onViewModelReady(StartupViewModel viewModel) {
    super.onViewModelReady(viewModel);
    // Always call initialize - the ViewModel will handle duplicate calls
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initialize();
    });
  }
  
  @override
  bool get disposeViewModel => true; // Ensure ViewModel is properly disposed
}