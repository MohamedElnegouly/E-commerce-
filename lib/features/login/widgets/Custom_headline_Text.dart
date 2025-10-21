import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int size;
  final FontWeight? fontWeight;
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:TextAlign.start,
      style: TextStyle(
        color: AppColors.white,
        fontSize: size.toDouble(),
        fontFamily: 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w600,
        height: 1,
        letterSpacing: -0.17,
      ),
    );
  }
}
