import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:cafe_app/ui/widgets/cafe_card_widget.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fafb),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
              decoration: const BoxDecoration(
                color: Color(0xff056780),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_pin, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Bahrain Financial Harbour',
                                  style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                              Text('Oz Muharraq',
                                  style: TextStyle(color: Colors.white70, fontSize: 11)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('Profile icon tapped'); // Debug print
                              viewModel.navigateToProfile();
                            },
                            child: const Icon(Icons.person_outline, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Loyalty Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Bronze Medal Icon
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffCD7F32), 
                                Color(0xffB8860B), 
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.military_tech, // Medal icon
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            children: [
                              // Oz Loyalty Section
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Oz Loyalty", style: TextStyle(fontSize: 12, color: Colors.black)),
                                  Text("Bronze", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff056780))),
                                ],
                              ),
                              const SizedBox(width: 20),
                              // Diagonal Line
                              Transform.rotate(
                                angle: 1.5708, // 90 degrees in radians
                                child: Container(
                                  height: 1,
                                  width: 30,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(width: 20),
                              // Oz Points Section
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Oz Points", style: TextStyle(fontSize: 12, color: Colors.black)),
                                  Text("2000 pts", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionButton(Icons.location_pin, 'Pickup', () {
                    print('Pickup button tapped'); // Debug print
                    viewModel.handlePickup();
                  }),
                  _actionButton(Icons.local_shipping, 'Delivery', () {
                    print('Delivery button tapped'); // Debug print
                    viewModel.handleDelivery();
                  }),
                  _actionButton(Icons.calendar_today, 'Subscribe', () {
                    print('Subscribe button tapped'); // Debug print
                    viewModel.navigateToSubscribe();
                  }),
                  _actionButton(Icons.more_horiz, 'More', () {
                    print('More button tapped'); // Debug print
                    viewModel.handleMore();
                  }),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Ads Carousel
            SizedBox(
              height: 160,
              child: PageView.builder(
                onPageChanged: (index) {
                  viewModel.setAdIndex(index);
                },
                itemCount: viewModel.ads.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(viewModel.ads[index]['image']!, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // Dots (moved to left and color changed)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, 
                children: List.generate(viewModel.ads.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == viewModel.currentAdIndex ? const Color(0xFFFEEDCB) : Colors.grey[300], // Active dot color changed
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
            // Nearby Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Nearby", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(color: Color(0xffFEEDCB))),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: viewModel.nearbyPlaces.map((place) {
                  return CafeCardWidget(
                    name: place['name']!,
                    location: place['location']!,
                    status: place['status']!,
                    distance: place['distance']!,
                    imageUrl: place['image']!,
                    isOpen: place['status'] == 'Open',
                    rating: place['rating'] ?? 4.5, 
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
            
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff056780).withOpacity(0.1),
                ),
              ),
            
              Container(
                height: 40, 
                width: 40, 
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xff056780), Color(0xff044a5c)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Center(child: Icon(icon, color: Colors.white, size: 18)), 
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
