import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/home/presentation/manager/products_cubit/cubit/all_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/Home_repo.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllProductsCubit(getIt.get<HomeRepo>())..getProducts(),
      child: const Scaffold(
        body: HomeScreenBody(),
      ),
    );
  }
}
