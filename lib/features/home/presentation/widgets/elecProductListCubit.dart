import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/presentation/manager/electronics_cubit/cubit/electronics_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Elecproductlistcubit extends StatelessWidget {
  const Elecproductlistcubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectronicsProductCubit, ElectronicsProductState>(
      builder: (context, state) {
        bool isLoading = state is ElectronicsProductLoading;
        List<ProductModel> products = [];

        if (state is ElectronicsProductSuccess) {
          products = state.electronicsProducts;
        } else if (state is ElectronicsProductFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is ElectronicsProductLoading) {
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
