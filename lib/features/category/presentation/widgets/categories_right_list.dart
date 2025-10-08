import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoriesRightList extends StatelessWidget {
  const CategoriesRightList({
    super.key,
    required this.categoryName,
    required this.bannerImage,
    required this.subCategories,
  });

  final String categoryName;
  final String bannerImage;
  final List<CategoryModel> subCategories;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          // 🟦 عنوان التصنيف
          Text(
            categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.darkBlue,
            ),
          ),
          const SizedBox(height: 16),

          // 🟨 صورة البانر
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: bannerImage,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 140,
                color: Colors.grey.shade300,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, size: 60),
            ),
          ),

          const SizedBox(height: 20),

          // 🟩 شبكة الفئات الفرعية (Subcategories)
          GridView.builder(
            shrinkWrap: true, // ✅ علشان تاخد حجم محتواها فقط
            physics:
                const NeverScrollableScrollPhysics(), // ✅ ممنوع تسكرول لوحدها
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.75,
            ),
            itemCount: subCategories.length,
            itemBuilder: (context, index) {
              final subCategory = subCategories[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: subCategory.image ??
                          'https://picsum.photos/300/120',
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 70,
                        width: 70,
                        color: Colors.grey.shade200,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subCategory.name ?? "Subcategory",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
