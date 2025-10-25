import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:e_commerce/core/utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<AuthModel>('userBox');
    final user = box.get('user');

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primary,
      ),
      body: user == null
          ? Center(
              child: Text(
                'No user data found',
                style: TextStyle(color: AppColors.darkBlue, fontSize: 18),
              ),
            )
          : ProfileBody(user: user),
    );
  }
}
