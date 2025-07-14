import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cafe_app/ui/widgets/discount_ticket_widget.dart'; 
import 'subscribe_viewmodel.dart';

class SubscribeView extends StackedView<SubscribeViewModel> {
  const SubscribeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SubscribeViewModel viewModel,
    Widget? child,
  ) {
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
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              '${viewModel.currentPoints} pts',
              style: const TextStyle(
                color: Color(0xFF056780),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Duration Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: viewModel.durations.map((duration) {
                final isSelected = viewModel.selectedDuration == duration;
                return GestureDetector(
                  onTap: () => viewModel.setSelectedDuration(duration),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF056780) : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: isSelected ? const Color(0xFF056780) : Colors.grey[300]!,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: const Color(0xFF056780).withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Text(
                      duration,
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF056780),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Subscription Plans
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: viewModel.subscriptionPlans.length,
              itemBuilder: (context, index) {
                final plan = viewModel.subscriptionPlans[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: DiscountTicketWidget(
                    title: plan['title'],
                    subtitle: plan['subtitle'],
                    value: plan['voucherCount'],
                    icon: Icons.percent,
                    onTap: () {
                      print('SubscribeView: Tapping plan: ${plan['id']}'); // Debug print
                      viewModel.navigateToSubscriptionDetails(plan);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  SubscribeViewModel viewModelBuilder(BuildContext context) => SubscribeViewModel();
}
