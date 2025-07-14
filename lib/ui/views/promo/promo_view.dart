import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cafe_app/ui/widgets/discount_ticket_widget.dart';
import 'package:cafe_app/ui/widgets/cafe_card_widget.dart';

class PromoView extends StatelessWidget {
  const PromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Promo Ticket using DiscountTicketWidget
                    DiscountTicketWidget(
                      title: 'Discount up to 5%',
                      subtitle: 'Learn for more info',
                      value: '2 Voucher',
                      icon: Icons.percent,
                      onTap: () {
                        // Handle tap for this promo ticket
                        print('Promo ticket 1 tapped!');
                      },
                    ),
                    const SizedBox(height: 24),
                    // First Store Section
                    _buildStoreSection([
                      CafeCardWidget(
                        name: 'Oz Cafe Seef',
                        location: 'Seef District',
                        status: 'Open • 21:00',
                        distance: '2.10 km',
                        imageUrl: 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=400',
                        isOpen: true,
                        rating: 4.8,
                      ),
                      CafeCardWidget(
                        name: 'Oz Cafe Muharraq',
                        location: 'Janabiyah',
                        status: 'Close',
                        distance: '4.80 km',
                        imageUrl: 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=400',
                        isOpen: false,
                        rating: 4.2,
                      ),
                    ]),
                    const SizedBox(height: 24),
                    // Second Promo Ticket using DiscountTicketWidget
                    DiscountTicketWidget(
                      title: 'Special Offer!',
                      subtitle: 'Limited time only',
                      value: '5 Voucher',
                      icon: Icons.local_offer,
                      iconColor: Colors.orange,
                      backgroundColor: Colors.orange.shade50,
                      textColor: Colors.orange.shade800,
                      onTap: () {
                        // Handle tap for this promo ticket
                        print('Promo ticket 2 tapped!');
                      },
                    ),
                    const SizedBox(height: 24),
                    // Second Store Section
                    _buildStoreSection([
                      CafeCardWidget(
                        name: 'Oz Cafe Jurdab',
                        location: 'Jurdab',
                        status: 'Open • 21:00',
                        distance: '3.20 km',
                        imageUrl: 'https://images.pexels.com/photos/2253643/pexels-photo-2253643.jpeg?auto=compress&cs=tinysrgb&w=400',
                        isOpen: true,
                        rating: 4.6,
                      ),
                      CafeCardWidget(
                        name: 'Oz Cafe 10',
                        location: 'Janabiyah',
                        status: 'Close',
                        distance: '4.80 km',
                        imageUrl: 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=400',
                        isOpen: false,
                        rating: 4.4,
                      ),
                    ]),
                    // Bottom spacing for navigation
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Promo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontFamily: 'Roboto',
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFEEDCB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'Roboto',
                ),
                children: [
                  TextSpan(text: '2000 '),
                  TextSpan(
                    text: 'pts',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreSection(List<Widget> storeCards) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Store',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Roboto',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF056780),
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: storeCards[0]),
            const SizedBox(width: 12),
            Expanded(child: storeCards[1]),
          ],
        ),
      ],
    );
  }
}
