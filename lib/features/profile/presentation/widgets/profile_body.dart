import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';
import 'package:e_commerce/features/profile/presentation/widgets/account_circle_avatar.dart';
import 'package:e_commerce/features/profile/presentation/widgets/account_delete_button.dart';
import 'package:e_commerce/features/profile/presentation/widgets/loggedOut_button.dart';
import 'package:flutter/material.dart';
class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.user,
  });

  final AuthModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AccountCircleAvatar(user: user),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                user?.user?.name ?? '',
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                user?.user?.email ?? '',
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Divider(color: AppColors.darkBlue),
            const SizedBox(height: 20),
            LoggedOutButton(),
            const SizedBox(height: 20),
            AccountDeleteButton(),
          ],
        ),
      );
  }
}



