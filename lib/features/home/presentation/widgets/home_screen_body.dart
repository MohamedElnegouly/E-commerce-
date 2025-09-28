import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/presentation/manager/products_cubit/cubit/all_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/Home_Body.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        bool isLoading = state is AllProductsLoading;
        List<ProductModel> products = [];

        if (state is AllProductsSuccess) {
          products = state.products;
        } else if (state is AllProductsfailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is AllProductsLoading) {
          products = List.generate(
            6,
            (index) => ProductModel(), // منتجات فاضية للـ Skeleton
          );
        }

        return Skeletonizer(
          enabled: isLoading, // بيشتغل وقت الـ loading بس
          child: HomeBody(products: products), // نفس الـ UI دايمًا
        );
      },
    );
  }
}
