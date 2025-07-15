import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'onboarding_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';


class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return Scaffold(
      body: PageView(
        controller: viewModel.pageController,
        onPageChanged: viewModel.setPage,
        children: [
          _buildWelcomeScreen(viewModel),
          _buildLoginOptionsScreen(viewModel),
          _buildRegisterScreen(viewModel),
          _buildLoginScreen(viewModel),
        ],
      ),
    );
  }

Widget _buildWelcomeScreen(OnboardingViewModel viewModel) {
  return Container(
    color: const Color(0xff056780),
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
Padding(
  padding: const EdgeInsets.only(top: 24.0), 
  child: Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/coffee_bean_logo.svg',
          width: 32,
          height: 32,
        ),
        const SizedBox(width: 12),
        const Text(
          "Oz Cafe",
          style: TextStyle(
            color: Color(0xffFEEDCB),
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  ),
),

          // Bottom: Main Text and Button
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                const Text(
                  "Explore more\nabout real coffee.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffFEEDCB),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: viewModel.nextPage,
                  child: const Text(
                    "Start",
                    style: TextStyle(
                      color: Color(0xffFEEDCB),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildLoginOptionsScreen(OnboardingViewModel viewModel) {
    return Container(
      color: Colors.white, // White background
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
const SizedBox(height: 40),

// Oz Cafe title 
Center(
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(
        'assets/icons/coffee_bean_logo.svg',
        width: 32,
        height: 32,
        ),

      const SizedBox(width: 12),
      const Text(
        "Oz Cafe",
        style: TextStyle(
          color: Color(0xffFEEDCB),
          fontSize: 36, 
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  ),
),

          const SizedBox(height: 20),

          // Illustration
          Center(
            child: SvgPicture.asset(
              'assets/icons/illustration.svg',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),

            const SizedBox(height: 60),
            // Social login buttons
            _buildSocialButton(
              onPressed: viewModel.nextPage,
              icon: Icons.email_outlined,
              text: "Email or Phone Number",
              backgroundColor: const Color(0xff056780),
              textColor: Colors.white,
            ),
            const SizedBox(height: 16),
            _buildSocialButton(
              onPressed: () {},
              icon: Icons.g_mobiledata,
              text: "Google",
              backgroundColor: const Color(0xffFEEDCB),
              textColor: const Color(0xff056780),
              borderColor: const Color(0xffe5e7eb),
            ),
            const SizedBox(height: 16),
            _buildSocialButton(
              onPressed: () {},
              icon: Icons.facebook,
              text: "Facebook",
              backgroundColor: const Color(0xff1877f2),
              textColor: Colors.white,
            ),
            const SizedBox(height: 16),
            _buildSocialButton(
              onPressed: () {},
              icon: Icons.apple,
              text: "Apple",
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "Don't have an account yet? ",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                        color: Color(0xff056780),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: 1)
                : BorderSide.none,
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildRegisterScreen(OnboardingViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    onPressed: viewModel.previousPage,
                    icon: const Icon(Icons.arrow_back_ios),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xfff3f4f6),
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff111827),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), 
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please fill in your details to create your account",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6b7280),
                ),
              ),
              const SizedBox(height: 32),
              _buildTextField(
                hint: "Full Name",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                hint: "Email Address",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                hint: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                hint: "Confirm Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff056780),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginScreen(OnboardingViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    onPressed: viewModel.previousPage,
                    icon: const Icon(Icons.arrow_back_ios),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xfff3f4f6),
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff111827),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sign in to your account to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6b7280),
                ),
              ),
              const SizedBox(height: 32),
              _buildTextField(
                hint: "Email or Phone Number",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                hint: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xff056780),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.navigateToHome();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff056780),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xff9ca3af),
          fontSize: 16,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xff9ca3af),
          size: 20,
        ),
        suffixIcon: isPassword
            ? const Icon(
                Icons.visibility_off_outlined,
                color: Color(0xff9ca3af),
                size: 20,
              )
            : null,
        filled: true,
        fillColor: const Color(0xfff9fafb),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffe5e7eb),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffe5e7eb),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xff056780),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) => OnboardingViewModel();
}