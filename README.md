# ☕ OZ Coffee - Flutter Mobile App

A beautiful and feature-rich coffee shop mobile application built with Flutter, featuring a modern UI, subscription management, cart functionality, and loyalty points system.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

## 📱 Screenshots

| Home Screen | Menu | Item Details | Subscription |
|-------------|------|--------------|--------------|
| ![Home](https://via.placeholder.com/200x400/056780/FFFFFF?text=Home) | ![Menu](https://via.placeholder.com/200x400/056780/FFFFFF?text=Menu) | ![Details](https://via.placeholder.com/200x400/056780/FFFFFF?text=Details) | ![Subscribe](https://via.placeholder.com/200x400/056780/FFFFFF?text=Subscribe) |

## ✨ Features

### 🏠 Core Features
- **Beautiful Home Screen** For cafe discovery
- **Onboarding Flow** with multiple screens
- **Interactive Menu** with category filtering
- **Detailed Item Views** with ingredients, calories
- **Shopping Cart** with quantity management and price calculation
- **User Profile** with loyalty status and points tracking

### 🎫 Subscription System Membership Flow
- **Multiple Subscription Plans** with different durations (14, 30, 60 days)
- **Discount Vouchers** with percentage and fixed amount savings

### 🏆 Loyalty Program
- **Points System** 
- **Loyalty Tiers** 
- **Points History** 
- **Bonus Points** 

### 🛒 Shopping Experience
- **Add to Cart** functionality with quantity selection
- **Cart Management** with item modification and removal
- **Price Calculation** with real-time total updates

## 🏗️ Architecture

This app follows the **MVVM (Model-View-ViewModel)** pattern using the Stacked architecture:

\`\`\`
lib/
├── app/                    # App configuration and routing
├── services/              # Business logic and data services
├── ui/
│   ├── views/            # Screen widgets
│   ├── widgets/          # Reusable UI components
└── main.dart             # App entry point
\`\`\`

### 🔧 Tech Stack

- **Framework:** Flutter 3.x
- **State Management:** Stacked (MVVM)
- **Navigation:** Stacked Router with code generation
- **Dependency Injection:** GetIt with Stacked Locator
- **UI Components:** Custom widgets with Material Design 3

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   \`\`\`bash
   git clone https://github.com/ANasser00/cafe_app.git
   cd cafe_app
   \`\`\`

2. **Install dependencies**
   \`\`\`bash
   flutter pub get
   \`\`\`

3. **Generate code**
   \`\`\`bash
   flutter packages pub run build_runner build
   \`\`\`

4. **Run the app**
   \`\`\`bash
   flutter run
   \`\`\`

## 📦 Dependencies

### Core Dependencies
\`\`\`yaml
flutter:
  sdk: flutter
stacked: ^3.4.0
stacked_services: ^1.2.0
stacked_generator: ^1.3.0
\`\`\`

### Development Dependencies
\`\`\`yaml
build_runner: ^2.4.7
stacked_generator: ^1.3.0
\`\`\`

## 🎨 Design System

### Color Palette
- **Primary:** `#056780` (Teal Blue)
- **Secondary:** `#FEEDCB` (Cream)
- **Background:** `#F9FAFB` (Light Gray)
- **Text:** `#056780` (Primary Blue)

### Typography
- **Font Family:** Roboto
- **Heading:** Bold, 25-40px
- **Body:** Regular, 14-16px
- **Caption:** Regular, 11-12px

## 📱 Screens Overview

### 🏠 Home Screen
- Location-based cafe discovery
- Loyalty card display with points
- Action buttons (Pickup, Delivery, Subscribe, More)
- Promotional carousel
- Nearby cafes grid

### 🍽️ Menu Screen
- Category-based filtering
- Grid layout with item cards
- Shopping cart badge with item count
- Item images with pricing

### 📋 Item Details
- High-resolution item images
- Detailed descriptions and ingredients
- Nutritional information (calories, size)
- Quantity selector
- Add to cart functionality

### 🛒 Cart Screen
- Item list with images and details
- Quantity modification controls
- Price calculations
- Clear cart option
- Checkout button

### 🎫 Subscription System
- Multiple subscription plans
- Duration-based filtering (14/30/60 days)
- Detailed plan information
- Payment method selection
- Subscription management

### 👤 Profile Screen
- User information display
- Navigation to membership/loyalty
- Settings and preferences
- Logout functionality

## 🔄 State Management

The app uses **Stacked** for state management with the following pattern:

\`\`\`dart
class ExampleViewModel extends BaseViewModel {
  // Private state
  String _data = '';
  
  // Public getters
  String get data => _data;
  
  // Actions
  void updateData(String newData) {
    _data = newData;
    rebuildUi(); // Triggers UI rebuild
  }
}
\`\`\`

## 🛣️ Navigation

Navigation is handled by **Stacked Router** with code generation:

\`\`\`dart
// Navigate to a screen
_navigationService.navigateToItemDetailsView(item: selectedItem);

// Navigate with arguments
_navigationService.navigateToSubscriptionDetailsView(plan: selectedPlan);
\`\`\`

## 🧪 Testing

Run tests with:
\`\`\`bash
flutter test
\`\`\`

## 🚀 Building for Production

### Android
\`\`\`bash
flutter build apk --release
\`\`\`

### iOS
\`\`\`bash
flutter build ios --release
\`\`\`







