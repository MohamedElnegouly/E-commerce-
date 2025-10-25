import 'dart:async';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    final userBox = Hive.box<AuthModel>('userBox');
    final user = userBox.get('user');

    if (user != null && user.token != null) {
      // if user logged before --> go to Home
      if (mounted) context.go('/home');
    } else {
      // else go to Login
      if (mounted) context.go('/login');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Image.asset(
            'assets/images/matgar_logo.png', // حط مسار اللوجو بتاعك
            width: 250,
          ),
        ),
      ),
    );
  }
}
