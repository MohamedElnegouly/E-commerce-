import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoryElement extends StatelessWidget {
  const CategoryElement({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
       ClipRRect(
  borderRadius: BorderRadius.circular(50), // نصف العرض/الارتفاع لو عايزها دايرة
  child: CachedNetworkImage(
    imageUrl: category.image ?? '',
    width: 100,
    height: 100,
    fit: BoxFit.cover,
    placeholder: (context, url) => const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    ),
    errorWidget: (context, url, error) => Image.asset(
      "assets/images/Ellipse 14.png",
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ),
  ),
),

        const SizedBox(height: 4),
        Text(
          category.name!,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            height: 1.7,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
