import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/cart_service.dart';

class MenuViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _cartService = locator<CartService>();

  List<Map<String, dynamic>> menuItems = [];
  String selectedCategory = 'All';
  List<String> categories = ['All', 'Coffee', 'Food', 'Pastry', 'Drinks'];

  int get cartItemCount => _cartService.cartItems.length;

  MenuViewModel() {
    loadMockItems();
  }

  void loadMockItems() {
    menuItems = [
      {
        'id': '1',
        'name': 'Cappuccino',
        'price': 4.50,
        'image': 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=300',
        'description': 'Rich espresso with steamed milk and a thick layer of foam',
        'category': 'Coffee',
        'ingredients': ['Espresso', 'Steamed Milk', 'Milk Foam'],
        'calories': 120,
        'size': 'Medium',
      },
      {
        'id': '2',
        'name': 'Pancakes',
        'price': 3.25,
        'image': 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=300',
        'description': 'Buttery pancakes served with syrup',
        'category': 'Pastry',
        'ingredients': ['Flour', 'Eggs', 'Milk', 'Butter', 'Maple Syrup'],
        'calories': 350,
        'size': 'Regular',
      },
      {
        'id': '3',
        'name': 'Avocado Toast',
        'price': 8.75,
        'image': 'https://images.pexels.com/photos/1351238/pexels-photo-1351238.jpeg?auto=compress&cs=tinysrgb&w=300',
        'description': 'Fresh avocado on artisan bread with lime and herbs',
        'category': 'Food',
        'ingredients': ['Avocado', 'Artisan Bread', 'Lime', 'Herbs', 'Sea Salt'],
        'calories': 280,
        'size': 'Regular',
      },
      {
        'id': '4',
        'name': 'Chicken Sandwich',
        'price': 9.50,
        'image': 'https://images.pexels.com/photos/1209029/pexels-photo-1209029.jpeg?auto=compress&cs=tinysrgb&w=300',
        'description': 'Grilled chicken breast with fresh vegetables',
        'category': 'Food',
        'ingredients': ['Grilled Chicken', 'Lettuce', 'Tomato', 'Onion', 'Mayo'],
        'calories': 420,
        'size': 'Regular',
      },
      {
        'id': '5',
        'name': 'Orange Juice',
        'price': 3.75,
        'image': 'https://images.pexels.com/photos/96974/pexels-photo-96974.jpeg?auto=compress&cs=tinysrgb&w=300',
        'description': 'Freshly squeezed orange juice',
        'category': 'Drinks',
        'ingredients': ['Fresh Oranges'],
        'calories': 110,
        'size': 'Large',
      },
      {
        'id': '6',
        'name': 'Cortado',
        'price': 4.25,
        'image': 'https://images.pexels.com/photos/302901/pexels-photo-302901.jpeg?auto=compress&cs=tinysrgb&w=300',
        'description': 'Balanced espresso with warm milk',
        'category': 'Coffee',
        'ingredients': ['Espresso', 'Warm Milk'],
        'calories': 90,
        'size': 'Small',
      },
    ];
    rebuildUi();
  }

  void setSelectedCategory(String category) {
    selectedCategory = category;
    rebuildUi();
  }

// Replace your navigateToItemDetails method in MenuViewModel with this:

void navigateToItemDetails(Map<String, dynamic> item) {
  print('MenuViewModel: Navigating with item: $item'); // Debug print
  
  // Create a clean copy of the item to ensure all data is properly serialized
  final cleanItem = {
    'id': item['id']?.toString() ?? '',
    'name': item['name']?.toString() ?? 'Unknown Item',
    'price': item['price'] ?? 0.0,
    'image': item['image']?.toString() ?? '',
    'description': item['description']?.toString() ?? 'No description available',
    'category': item['category']?.toString() ?? 'General',
    'ingredients': item['ingredients'] ?? [],
    'calories': item['calories'] ?? 0,
    'size': item['size']?.toString() ?? 'Regular',
  };
  
  print('MenuViewModel: Clean item data: $cleanItem'); // Debug print
  
  _navigationService.navigateToItemDetailsView(item: cleanItem);
}

  void navigateToCart() {
    _navigationService.navigateToCartView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];
}
