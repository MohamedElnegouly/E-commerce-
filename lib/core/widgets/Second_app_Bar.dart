import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/shopping_Cart.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? productAndcardAppBar(String text) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: AppColors.primary),
      onPressed: () {},
    ),
    title: Center(
      child: Text(text, style: TextStyle(color: AppColors.darkBlue)),
    ),
    actions: [IconButton(icon: ShoppingCart(), onPressed: () {})],
  );
}
