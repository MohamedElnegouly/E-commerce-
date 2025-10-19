import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key, required this.totalPrice});

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Price',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.17,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'EGP $totalPrice',
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 1,
            letterSpacing: -0.17,
          ),
        ),
      ],
    );
  }
}
