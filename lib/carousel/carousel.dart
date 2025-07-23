import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'carousel_items/item_1.dart';
import 'carousel_items/item_2.dart';
import 'carousel_items/item_3.dart';
import 'carousel_items/item_4.dart';
import 'carousel_items/item_5.dart';
import 'carousel_items/item_6.dart';

class MyCarousel extends StatelessWidget {
  final pageController = PageController();

  Future<List<String?>> _loadAllImageUrls() async {
    return [
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 2),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 3),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 4),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 5),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 6),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 7),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String?>>(
      future: _loadAllImageUrls(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final urls = snapshot.data!;

        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              PageView(
                controller: pageController,
                children: [
                  Item1(imageUrl: urls[0]),
                  Item2(imageUrl: urls[1]),
                  Item3(imageUrl: urls[2]),
                  Item4(imageUrl: urls[3]),
                  Item5(imageUrl: urls[4]),
                  Item6(imageUrl: urls[5]),
                ],
              ),

              // Dots
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 6,
                      effect: WormEffect(
                        dotHeight: 6,
                        dotWidth: 6,
                        spacing: 6,
                        dotColor: Colors.white24,
                        activeDotColor: Colors.white
                      ),
                    )
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}