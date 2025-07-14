import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cafe_app/ui/widgets/discount_ticket_widget.dart';
import 'subscription_details_viewmodel.dart';

class SubscriptionDetailsView extends StackedView<SubscriptionDetailsViewModel> {
  final Map<String, dynamic> plan;
  const SubscriptionDetailsView({Key? key, required this.plan}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SubscriptionDetailsViewModel viewModel,
    Widget? child,
  ) {
    print('SubscriptionDetailsView: Received plan: $plan'); // Debug print

    // Safe access to plan properties with fallbacks (similar to ItemDetailsView)
    final String planId = plan['id']?.toString() ?? '';
    final String title = plan['title']?.toString() ?? 'Unknown Plan';
    final String subtitle = plan['subtitle']?.toString() ?? '';
    final String voucherCount = plan['voucherCount']?.toString() ?? '0 Voucher';
    final double price = _parsePrice(plan['price']);
    final String duration = plan['duration']?.toString() ?? 'N/A';
    final String description = plan['description']?.toString() ?? 'No description available.';
    final String renewalInfo = plan['renewalInfo']?.toString() ?? 'No renewal information available.';
    final int bonusPoints = _parseInt(plan['bonusPoints']);
    final double saveAmount = _parsePrice(plan['saveAmount']);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => viewModel.goBack(),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF056780)),
        ),
        title: const Text(
          'Subscribe',
          style: TextStyle(
            color: Color(0xFF056780),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              // Handle info button tap
              print('Info button tapped for plan: $planId');
            },
            icon: const Icon(Icons.info_outline, color: Color(0xFF056780)),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Plan Display Widget
                DiscountTicketWidget(
                  title: title,
                  subtitle: subtitle,
                  value: voucherCount,
                  icon: Icons.percent,
                ),
                const SizedBox(height: 20),
                
                // Save Amount Banner
                if (saveAmount > 0)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEEDCB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF056780).withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFF056780), size: 24),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Save up to \$${saveAmount.toStringAsFixed(2)} with this perk!',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF056780),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                const SizedBox(height: 20),
                
                // Plan Details Cards
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailCard(
                        'Duration',
                        duration,
                        Icons.access_time,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDetailCard(
                        'Price',
                        '\$${price.toStringAsFixed(2)}',
                        Icons.attach_money,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                if (bonusPoints > 0)
                  Row(
                    children: [
                      Expanded(
                        child: _buildDetailCard(
                          'Bonus Points',
                          bonusPoints.toString(),
                          Icons.stars,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDetailCard(
                          'Vouchers',
                          voucherCount,
                          Icons.local_offer,
                        ),
                      ),
                    ],
                  ),
                
                const SizedBox(height: 20),
                
                // How it works section
                Text(
                  'How does this subscription plan work?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF056780).withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color(0xFF056780).withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Renewal and cancellation section
                Text(
                  'How do I renew and cancel?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF056780).withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  renewalInfo,
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color(0xFF056780).withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 100), // Space for the bottom button
              ],
            ),
          ),
          
          // Bottom Subscribe Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                    onPressed: viewModel.isLoading 
                        ? null 
                        : () {
                            print('Subscribe button pressed for plan: $planId'); // Debug print
                            viewModel.navigateToSubscribePayment(plan);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF056780),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: viewModel.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Subscribe $duration - \$${price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for safe parsing (same as ItemDetailsView)
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

  // Detail card widget (similar to ItemDetailsView)
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
  SubscriptionDetailsViewModel viewModelBuilder(BuildContext context) =>
      SubscriptionDetailsViewModel();
}
