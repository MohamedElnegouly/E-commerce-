import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/Authentication/presentation/screen/widgets/login_body_view.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: LoginBodyView(),
    );
  }
}
