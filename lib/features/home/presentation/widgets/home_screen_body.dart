import 'package:e_commerce/features/home/presentation/manager/products_cubit/cubit/all_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/Home_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        if (state is AllProductsSuccess) {
          return HomeBody(products: state.products,);
        } else if (state is AllProductsfailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is AllProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}
