import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TitleHeadLine extends StatelessWidget {
  const TitleHeadLine({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            title,
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
