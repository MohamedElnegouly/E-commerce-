import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryElement extends StatelessWidget {
  const CategoryElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const ShapeDecoration(
            color: Color(0xFFF3F5F7),
            shape: OvalBorder(),
          ),
          child: const Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/Ellipse 16.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        //const SizedBox(height: 4),
        const Text(
          'Laptops',
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
