import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text('View All', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
