import 'package:flutter/material.dart';

import 'carousel_items/item_1.dart';
import 'carousel_items/item_2.dart';
import 'carousel_items/item_3.dart';

class MyCarousel extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(15),
      child: PageView(
        controller: pageController,
        children: [
          Item1(),
          Item2(),
          Item3(),
        ],
      ),
    );
  }
}