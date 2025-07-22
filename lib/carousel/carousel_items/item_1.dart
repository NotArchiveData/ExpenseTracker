import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';

class Item1 extends StatefulWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  State<Item1> createState() => _Item1State();
}

class _Item1State extends State<Item1> {
  String? imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final fetchedUrl = await GoogleSheetsApi.fetchImageUrlFromSheet(8, 2);
    setState(() {
      imageUrl = fetchedUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: isLoading
          ? const CircularProgressIndicator()
          : imageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Text("Failed to load image"),
                  ),
                )
              : const Text("No image found"),
    );
  }
}
