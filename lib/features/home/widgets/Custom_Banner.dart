import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
    required this.imagePath,
    required this.title,
    required this.discount,
    this.direction,
  });
  final String imagePath;
  final String title;
  final String discount;
  final String? direction;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
          Positioned(
            left: direction == 'right' ? null : 20,
            right: direction == 'right' ? 0 : null,
            top: 75,
            child: SizedBox(
              width: 136,
              child: Text(
                title,
                style: TextStyle(
                  color: direction == 'right'
                      ? AppColors.white
                      : AppColors.primary,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.29,
                  letterSpacing: -0.17,
                ),
              ),
            ),
          ),
          Positioned(
            left: direction == 'right' ? null : 16,
            right: direction == 'right' ? 76 : null,
            top: 25,
            child: Text(
              'UP TO',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: direction == 'right'
                    ? AppColors.white
                    : AppColors.primary,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.82,
                letterSpacing: -0.17,
              ),
            ),
          ),
          Positioned(
            left: direction == 'right' ? null : 16,
            right: direction == 'right' ? 40 : null,
            top: 50,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: discount,
                    style: TextStyle(
                      color: direction == 'right'
                          ? AppColors.white
                          : AppColors.primary,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.60,
                      letterSpacing: -0.17,
                    ),
                  ),
                  TextSpan(
                    text: ' OFF ',
                    style: TextStyle(
                      color: direction == 'right'
                          ? AppColors.white
                          : AppColors.primary,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.90,
                      letterSpacing: -0.17,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 17,
            left: direction == 'right' ? null : 20,
            right: direction == 'right' ? 30 : null,
            child: ElevatedButton(
              onPressed: () {
                // نفّذ الإجراء المطلوب عند الضغط
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Shop Now',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
