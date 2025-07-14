import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'item_details_viewmodel.dart';

class ItemDetailsView extends StackedView<ItemDetailsViewModel> {
  final Map<String, dynamic> item;
  
  const ItemDetailsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ItemDetailsViewModel viewModel,
    Widget? child,
  ) {
    print('ItemDetailsView: Received item: $item'); // Debug print

    // Safe access to item properties with fallbacks
    final String itemName = item['name']?.toString() ?? 'Unknown Item';
    final double itemPrice = _parsePrice(item['price']);
    final String itemImage = item['image']?.toString() ?? '';
    final String itemDescription = item['description']?.toString() ?? 'No description available';
    final String itemCategory = item['category']?.toString() ?? 'General';
    final List<String> itemIngredients = _parseIngredients(item['ingredients']);
    final int itemCalories = _parseInt(item['calories']);
    final String itemSize = item['size']?.toString() ?? 'Regular';

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF056780),
            leading: IconButton(
              onPressed: () => viewModel.goBack(),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () => viewModel.toggleFavorite(),
                icon: Icon(
                  viewModel.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: viewModel.isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: itemImage.isNotEmpty
                  ? Image.network(
                      itemImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 50,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          itemName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF056780),
                          ),
                        ),
                      ),
                      Text(
                        '\$${itemPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF056780),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Category Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEEDCB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      itemCategory,
                      style: const TextStyle(
                        color: Color(0xFF056780),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF056780),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    itemDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8E8E93),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Details Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildDetailCard(
                          'Size',
                          itemSize,
                          Icons.straighten,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDetailCard(
                          'Calories',
                          itemCalories.toString(),
                          Icons.local_fire_department,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Ingredients
                  if (itemIngredients.isNotEmpty) ...[
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF056780),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: itemIngredients
                          .map((ingredient) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0xFF056780).withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  ingredient,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF056780),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 30),
                  ],
                  // Quantity Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Quantity: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF056780),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF056780)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: viewModel.decrementQuantity,
                              icon: const Icon(
                                Icons.remove,
                                color: Color(0xFF056780),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '${viewModel.quantity}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF056780),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: viewModel.incrementQuantity,
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xFF056780),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
          ),
        ],
      ),
      // Add to Cart Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                print('Add to cart button pressed'); // Debug print
                viewModel.addToCart(item);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF056780),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
              ),
              child: Text(
                'Add to Cart - \$${(itemPrice * viewModel.quantity).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper methods for safe parsing
  double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) return double.tryParse(price) ?? 0.0;
    return 0.0;
  }

  int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  List<String> _parseIngredients(dynamic ingredients) {
    if (ingredients == null) return [];
    if (ingredients is List) {
      return ingredients.map((e) => e.toString()).toList();
    }
    return [];
  }

  Widget _buildDetailCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF056780).withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF056780),
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8E8E93),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF056780),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ItemDetailsViewModel viewModelBuilder(BuildContext context) =>
      ItemDetailsViewModel();
}
