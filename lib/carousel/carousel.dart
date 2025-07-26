import 'package:cached_network_image/cached_network_image.dart';
import 'package:expensetracker/carousel/image_cache_preloader.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCarousel extends StatelessWidget {
  final pageController = PageController();

  Widget buildImageWidget(String? url) {
    if (url == null) {
      return const Center(child: Text("No Image Found"));
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const Text('Failed to load'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrls = ImageCacheController().imageUrls;

    if (imageUrls.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: imageUrls.map<Widget>(buildImageWidget).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: imageUrls.length,
                  effect: WormEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    spacing: 6,
                    dotColor: Colors.white24,
                    activeDotColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
