import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF056780),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Khalifa Althawadi',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextButton(
                    onPressed: () {
                      // Handle edit profile
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Color(0xFF056780),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMenuItem(
                    Icons.location_on_outlined,
                    'Shipping Address',
                    () {
                      // Handle shipping address
                    },
                  ),
                  _buildMenuItem(
                    Icons.card_membership_outlined,
                    'Membership',
                    () => viewModel.navigateToMembership(), 
                  ),
                  _buildMenuItem(
                    Icons.favorite_outline,
                    'Favorite',
                    () {
                      // Handle favorite
                    },
                  ),
                  _buildMenuItem(
                    Icons.headset_mic_outlined,
                    'Contact Us',
                    () {
                      // Handle contact us
                    },
                  ),
                  _buildMenuItem(
                    Icons.help_outline,
                    'FAQ',
                    () {
                      // Handle FAQ
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildMenuItem(
                    Icons.logout,
                    'Logout',
                    () {
                      // Handle logout
                    },
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout ? Colors.red : const Color(0xFF056780), 
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isLogout ? Colors.red : const Color(0xFF056780), 
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: isLogout ? Colors.red : Colors.grey,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.grey[50],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
