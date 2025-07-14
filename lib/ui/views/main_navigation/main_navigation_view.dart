import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../home/home_view.dart';
import '../promo/promo_view.dart';
import '../menu/menu_view.dart';
import '../profile/profile_view.dart';
import 'main_navigation_viewmodel.dart';

class MainNavigationView extends StackedView<MainNavigationViewModel> {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainNavigationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: viewModel.currentIndex,
            children: [
              HomeView(),
              PromoView(),
              MenuView(),
              ProfileView(),
            ],
          ),
          _buildCustomBottomNavBar(viewModel),
        ],
      ),
    );
  }

  Widget _buildCustomBottomNavBar(MainNavigationViewModel viewModel) {
    return Positioned(
      bottom: 24,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildNavItem(
                Icons.home_outlined,
                0,
                viewModel.currentIndex,
                viewModel.setIndex,
              ),
              const SizedBox(width: 24),
              _buildNavItem(
                Icons.local_offer_outlined,
                1,
                viewModel.currentIndex,
                viewModel.setIndex,
              ),
              const SizedBox(width: 24),
              _buildNavItem(
                Icons.menu_book_outlined,
                2,
                viewModel.currentIndex,
                viewModel.setIndex,
              ),
              const SizedBox(width: 24),
              _buildNavItem(
                Icons.person_outline,
                3,
                viewModel.currentIndex,
                viewModel.setIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    int currentIndex,
    Function(int) onTap,
  ) {
    final bool isActive = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isActive 
              ? const Color(0xFF056780)
              : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: isActive ? [
            BoxShadow(
              color: const Color(0xFF056780).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Icon(
          icon,
          color: isActive 
              ? Colors.white
              : Colors.grey.shade400,
          size: 20,
        ),
      ),
    );
  }

  @override
  MainNavigationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainNavigationViewModel();
}