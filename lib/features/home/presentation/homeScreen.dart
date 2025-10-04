import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/home/presentation/manager/category_cubit/cubit/category_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/electronics_cubit/cubit/electronics_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/men_cubit/cubit/men_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/products_cubit/cubit/all_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/Home_Body.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/Home_repo.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              MenProductCubit(getIt.get<HomeRepo>())..getProducts(),
        ),
        BlocProvider(
          create: (context) =>
              ElectronicsProductCubit(getIt.get<HomeRepo>())..getProducts(),
        ),
      ],
      child: Scaffold(
        //bottomNavigationBar: const CustomNavigationBar(),
        body: HomeBody()),
    );
  }
}
