import 'package:cached_network_image/cached_network_image.dart';
import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';

class ImageCacheController {
  static final ImageCacheController _instance = ImageCacheController._internal();

  factory ImageCacheController() => _instance;

  ImageCacheController._internal();

  List<String?> imageUrls = [];

  Future<void> preloadImages(BuildContext context) async {
    final urls = [
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 2),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 3),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 4),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 5),
      await GoogleSheetsApi.fetchImageUrlFromSheet(8, 6),
    ];

    for (final url in urls) {
      if (url != null) {
        await precacheImage(CachedNetworkImageProvider(url), context);
      }
    }

    imageUrls = urls;
  }

  bool get isLoaded => imageUrls.isNotEmpty;
}
