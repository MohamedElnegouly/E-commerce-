import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsImages extends StatelessWidget {
  final List<String>? imageUrls;

  const ProductDetailsImages({super.key, this.imageUrls});

  @override
  Widget build(BuildContext context) {
    final images =
        imageUrls ??
        const [
          'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
          'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
          'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg',
        ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            final imageUrl = images[index];
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
