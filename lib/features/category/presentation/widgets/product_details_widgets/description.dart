import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'Description',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: -0.17,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This is a detailed description dfffffffffffffffffffffffffffffffffffffffffffffffdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhof the product. It provides information about the features, specifications, and benefits of the product to help customers make informed purchasing decisions.',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: -0.17,
            ),
            textAlign: TextAlign.justify,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
