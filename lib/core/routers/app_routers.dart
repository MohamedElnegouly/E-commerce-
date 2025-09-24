import 'package:e_commerce/core/utils/app_routers_strings.dart';
import 'package:e_commerce/features/home/homeScreen.dart';
import 'package:e_commerce/features/login/screen/login_screen.dart';
import 'package:e_commerce/features/register/screen/register_screen.dart';
import 'package:e_commerce/features/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  AppRouters();
  
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutersStrings.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutersStrings.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case AppRoutersStrings.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
        case AppRoutersStrings.home:
        return MaterialPageRoute(builder: (context) => const Homescreen());
      default:
        return MaterialPageRoute(builder: (context) => const Text('Error in routing'));
    }
  }
}
