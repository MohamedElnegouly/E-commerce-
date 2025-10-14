import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TitlePrice extends StatelessWidget {
  const TitlePrice({super.key, required this.title, required this.price});
  final String title;
  final num? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
         Expanded(
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis, // عشان ما يعملش overflow
        style: TextStyle(
          color: AppColors.darkBlue,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: 1,
          letterSpacing: -0.17,
        ),
      ),
    ),

          Spacer(),
          Text(
            'EGP $price',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: -0.17,
            ),
          ),
        ],
      ),
    );
  }
}
