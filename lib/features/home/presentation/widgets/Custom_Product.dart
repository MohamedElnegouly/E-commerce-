import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:flutter/material.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // نحسب scaling factor
    final scale = size.width / 400;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // الصورة + أيقونة Favorite
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: product.imageCover?.isNotEmpty == true
                    ? CachedNetworkImage(
                        imageUrl: product.imageCover!,
                        height: size.height * 0.18,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/Frame 65.png",
                          height: size.height * 0.18,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        "assets/images/Frame 65.png",
                        height: size.height * 0.18,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16 * scale.clamp(0.8, 1.2),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.blue,
                    size: 18 * scale.clamp(0.8, 1.2),
                  ),
                ),
              ),
            ],
          ),

          // النصوص + الأسعار
          Padding(
            padding: EdgeInsets.all(8.0 * scale.clamp(0.8, 1.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brand?.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14 * scale.clamp(0.8, 1.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  product.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12 * scale.clamp(0.8, 1.5),
                  ),
                ),
                SizedBox(height: 4 * scale),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "EGP${product.price.toString()}",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14 * scale.clamp(0.8, 1.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 6 * scale),
                  ],
                ),
                SizedBox(height: 4 * scale),
                Row(
                  children: [
                    Text(
                      "Review (${product.ratingsAverage ?? 0})",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12 * scale.clamp(0.8, 1.5),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 5 * scale),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 14 * scale.clamp(0.8, 1.5),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 16 * scale.clamp(0.8, 1.4),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16 * scale.clamp(0.8, 1.3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
