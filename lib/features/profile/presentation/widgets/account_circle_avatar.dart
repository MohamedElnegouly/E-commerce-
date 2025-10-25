import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';
import 'package:flutter/material.dart';

class AccountCircleAvatar extends StatelessWidget {
  const AccountCircleAvatar({
    super.key,
    required this.user,
  });
  final AuthModel? user;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.darkBlue,
      child: Text(
        user?.user?.name.substring(0, 1).toUpperCase() ?? '?',
        style: TextStyle(
          fontSize: 40,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
