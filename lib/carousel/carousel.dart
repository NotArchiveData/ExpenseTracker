import 'package:cached_network_image/cached_network_image.dart';
import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Future<List<String?>> _loadAllImageUrls(BuildContext context) async {
  final urls = [
    await GoogleSheetsApi.fetchImageUrlFromSheet(8, 2),
    await GoogleSheetsApi.fetchImageUrlFromSheet(8, 3),
    await GoogleSheetsApi.fetchImageUrlFromSheet(8, 4),
    await GoogleSheetsApi.fetchImageUrlFromSheet(8, 5),
    await GoogleSheetsApi.fetchImageUrlFromSheet(8, 6),
  ];

  // Precache all images
  for (final url in urls) {
    if (url != null) {
      precacheImage(CachedNetworkImageProvider(url), context);
    }
  }

  return urls;
}

class MyCarousel extends StatelessWidget {
  final pageController = PageController();

  

  Widget buildImageWidget(String? url) {
    if (url == null) {
      return const Text("No Image Found");
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const Text('Failed to load image'),
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String?>>(
      future: _loadAllImageUrls(context),
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
                children: urls.map<Widget>(buildImageWidget).toList(),
              ),

              // Dots
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 5,
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