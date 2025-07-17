import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'carousel_items/item_1.dart';
import 'carousel_items/item_2.dart';
import 'carousel_items/item_3.dart';

class MyCarousel extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(15),
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              Item1(),
              Item2(),
              Item3(),
            ],
          ),

          // dots
          Positioned(
            top: 230,
            left: 100,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  spacing: 6,
                  dotColor: Colors.white24,
                  activeDotColor: Colors.white
                ),
              )
            ),
          )
        ]
      ),
    );
  }
}