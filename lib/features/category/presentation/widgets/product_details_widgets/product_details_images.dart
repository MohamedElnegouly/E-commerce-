import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsImages extends StatelessWidget {
  final List<String>? imageUrls;
  const ProductDetailsImages({super.key, this.imageUrls});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageUrls!.length,
          itemBuilder: (context, index) {
            final imageUrl = imageUrls![index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 250,
                  height: 400,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    width: 120,
                    height: 120,
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
