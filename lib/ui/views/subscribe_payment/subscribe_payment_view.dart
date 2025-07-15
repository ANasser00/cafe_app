import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cafe_app/ui/widgets/discount_ticket_widget.dart';
import 'subscribe_payment_viewmodel.dart';

class SubscribePaymentView extends StackedView<SubscribePaymentViewModel> {
  final Map<String, dynamic> plan;
  const SubscribePaymentView({Key? key, required this.plan}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SubscribePaymentViewModel viewModel,
    Widget? child,
  ) {
    final String title = plan['title'] ?? 'Unknown Plan';
    final String subtitle = plan['subtitle'] ?? '';
    final String voucherCount = plan['voucherCount'] ?? '0 Voucher';
    final double price = plan['price'] ?? 0.0;
    final int bonusPoints = plan['bonusPoints'] ?? 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => viewModel.goBack(),
          icon: const Icon(Icons.close, color: Color(0xFF056780)),
        ),
        title: const Text(
          'Subscription Payment',
          style: TextStyle(
            color: Color(0xFF056780),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF056780).withOpacity(0.9),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Handle add order
                      },
                      icon: const Icon(Icons.add, size: 18, color: Color(0xFF056780)),
                      label: const Text(
                        'Add Order',
                        style: TextStyle(color: Color(0xFF056780)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DiscountTicketWidget(
                  title: title,
                  subtitle: subtitle,
                  value: voucherCount,
                  icon: Icons.percent,
                ),
                const SizedBox(height: 30),

                // Payment Method Section
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF056780).withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.credit_card, color: Color(0xFF056780)),
                        title: const Text(
                          'Oz Pay',
                          style: TextStyle(color: Color(0xFF056780), fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                        onTap: () {
                          // Select Oz Pay
                        },
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.star, color: Color(0xFF056780)),
                        title: const Text(
                          'Points - 2000 pts',
                          style: TextStyle(color: Color(0xFF056780), fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text(
                          'Use your points (Min 1000 - Max 5000)',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        trailing: Switch(
                          value: viewModel.usePoints,
                          onChanged: viewModel.toggleUsePoints,
                          activeColor: const Color(0xFF056780),
                        ),
                        onTap: () => viewModel.toggleUsePoints(!viewModel.usePoints),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle voucher available
                    },
                    icon: const Icon(Icons.local_activity, color: Color(0xFF056780)),
                    label: const Text(
                      'Voucher Available',
                      style: TextStyle(
                        color: Color(0xFF056780),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEEDCB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: const Color(0xFF056780).withOpacity(0.2)),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Payment Summary Section
                Text(
                  'Payment Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF056780).withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 16, color: const Color(0xFF056780).withOpacity(0.8)),
                          ),
                          Text(
                            'BHD${price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, color: const Color(0xFF056780).withOpacity(0.8)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bonus Points',
                            style: TextStyle(fontSize: 16, color: const Color(0xFF056780).withOpacity(0.8)),
                          ),
                          Text(
                            '+${bonusPoints}pts',
                            style: TextStyle(fontSize: 16, color: Colors.green[700]),
                          ),
                        ],
                      ),
                      const Divider(height: 20, color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF056780),
                            ),
                          ),
                          Text(
                            'BHD${price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF056780),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100), 
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
                    onPressed: () {
                      // Handle final subscribe action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF056780),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Subscribe',
                      style: TextStyle(
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

  @override
  SubscribePaymentViewModel viewModelBuilder(BuildContext context) =>
      SubscribePaymentViewModel();
}
