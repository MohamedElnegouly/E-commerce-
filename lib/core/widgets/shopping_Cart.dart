import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Icon(
            CupertinoIcons.shopping_cart,
            size: 27,
            color: AppColors.primary,      
    );
  }
}