import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/presentation/manager/men_cubit/cubit/men_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Menproductslistcubit extends StatelessWidget {
  const Menproductslistcubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenProductCubit, MenProductState>(
      builder: (context, state) {
        bool isLoading = state is MenProductLoading;
        List<ProductModel> products = [];

        if (state is MenProductSuccess) {
          products = state.menproducts;
        } else if (state is MenProductfailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is MenProductLoading) {
          products = List.generate(
            6,
            (index) => ProductModel(), // منتجات فاضية للـ Skeleton
          );
        }

        return Skeletonizer(
          enabled: isLoading, // بيشتغل وقت الـ loading بس
          child: ProductListView(products: products), // نفس الـ UI دايمًا
        );
      },
    );
  }
}
