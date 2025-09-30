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
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          clipBehavior: Clip.hardEdge, //borderRadius يخلي الصورة تتقص جوه الـ 
          child: Image.network(
            category.image!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/Ellipse 14.png",
                fit: BoxFit.cover,
              );
            },
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
