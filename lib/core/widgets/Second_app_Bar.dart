import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/shopping_Cart.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? productAndcardAppBar(
  BuildContext context,
  String text,
  bool isCart,
) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: AppColors.primary),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text(text, style: TextStyle(color: AppColors.darkBlue)),

    actions: isCart ? [IconButton(icon: ShoppingCart(), onPressed: () {})] : [],
  );
}
