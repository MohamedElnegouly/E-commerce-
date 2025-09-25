import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppliance extends StatelessWidget {
  const HomeAppliance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            'Home Appliance',
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
