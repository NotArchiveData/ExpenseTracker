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
              Item4(),
              Item5(),
              Item6(),
            ],
          ),

          // dots
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
              SizedBox(height:10)
            ]
          )
        ]
      ),
    );
  }
}