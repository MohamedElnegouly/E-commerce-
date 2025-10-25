import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
      child: ValueListenableBuilder(
        //listening to hive box changes
        valueListenable: Hive.box<AuthModel>('userBox').listenable(),
        builder: (context, Box<AuthModel> box, _) {
          final user = box.get('user');
          final userName = user?.user?.name ?? 'User';
          return Row(
            children: [
              Text(
                'Welcome, $userName!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
