import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Item4 extends StatelessWidget {
  final String? imageUrl;
  const Item4({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return const Text("No image found");
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const Text('Failed to load image'),
    );
  }
}