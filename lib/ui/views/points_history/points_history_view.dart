import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'points_history_viewmodel.dart';
class PointsHistoryView extends StackedView<PointsHistoryViewModel> {
  const PointsHistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PointsHistoryViewModel viewModel,
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
          'Haffee Points',
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
            },
            icon: const Icon(Icons.info_outline, color: Color(0xFF056780)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFEEDCB),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFF056780), size: 30),
                      const SizedBox(width: 10),
                      Text(
                        '${viewModel.currentPoints} pts',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF056780),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle redeem points
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF056780),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Redeem',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              'Haffee Points History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF056780),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: viewModel.pointsHistory.length,
              itemBuilder: (context, index) {
                final entry = viewModel.pointsHistory[index];
                if (entry['type'] == 'date') {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      entry['value'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            entry['description'],
                            style: TextStyle(
                              fontSize: 16,
                              color: const Color(0xFF056780).withOpacity(0.8),
                            ),
                          ),
                        ),
                        Text(
                          entry['points'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: entry['points'].startsWith('+') ? Colors.green[700] : Colors.red[700],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  PointsHistoryViewModel viewModelBuilder(BuildContext context) => PointsHistoryViewModel();
}
