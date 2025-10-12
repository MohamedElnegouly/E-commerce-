import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:e_commerce/features/category/presentation/Categories_Screen.dart';
import 'package:e_commerce/features/category/presentation/manager/cubit/category_screen_cubit.dart';
import 'package:e_commerce/features/category/presentation/manager/cubit/sub_categories_peoducts_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/Profile_Screen.dart';
import 'package:e_commerce/features/home/presentation/widgets/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/core/utils/app_routers_strings.dart';
import 'package:e_commerce/features/splash/screen/splash_screen.dart';
import 'package:e_commerce/features/login/screen/login_screen.dart';
import 'package:e_commerce/features/register/screen/register_screen.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';
import 'package:e_commerce/features/home/presentation/manager/category_cubit/cubit/category_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/electronics_cubit/cubit/electronics_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/men_cubit/cubit/men_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/products_cubit/cubit/all_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/Home_Body.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_navigation_bar.dart';

class AppRouters {
  static final router = GoRouter(
    initialLocation: AppRoutersStrings.home,
    routes: [
      /// 🔹 Splash Screen
      GoRoute(
        path: AppRoutersStrings.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      /// 🔹 Login Screen
      GoRoute(
        path: AppRoutersStrings.login,
        builder: (context, state) => const LoginScreen(),
      ),

      /// 🔹 Register Screen
      GoRoute(
        path: AppRoutersStrings.register,
        builder: (context, state) => const RegisterScreen(),
      ),

      /// 🧭 ShellRoute → يحتوي على Navigation Bar + Home Cubits
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CategoryCubit(getIt.get<HomeRepo>())..getCategory(),
              ),
              BlocProvider(
                create: (context) =>
                    AllProductsCubit(getIt.get<HomeRepo>())..getProducts(),
              ),
              BlocProvider(
                create: (context) =>
                    CategoryScreenCubit(getIt.get<CategoriesRepo>())
                      ..getCategory(),
              ),
              BlocProvider(
                create: (context) =>
                    MenProductCubit(getIt.get<HomeRepo>())..getProducts(),
              ),
              BlocProvider(
                create: (context) =>
                    ElectronicsProductCubit(getIt.get<HomeRepo>())
                      ..getProducts(),
              ),
            ],
            child: Scaffold(
              body: child,
              bottomNavigationBar: const CustomNavigationBar(),
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutersStrings.home,
            builder: (context, state) => const HomeBody(),
          ),
          GoRoute(
            path: AppRoutersStrings.categories,
            builder: (context, state) => const CategoriesScreen(),
          ),
          GoRoute(
            path: AppRoutersStrings.cart,
            builder: (context, state) => const CardScreen(),
          ),
          GoRoute(
            path: AppRoutersStrings.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
