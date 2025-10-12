import 'package:e_commerce/features/category/presentation/manager/cubit/sub_categories_peoducts_cubit.dart';
import 'package:e_commerce/features/category/presentation/widgets/subCategoryProductsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Subcategoriesproductslistview extends StatelessWidget {
  const Subcategoriesproductslistview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoriesPeoductsCubit, SubCategoriesPeoductsState>(
      builder: (context, state) {
        if (state is SubCategoriesPeoductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SubCategoriesPeoductsFailure) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else if (state is SubCategoriesPeoductsSuccess) {
          if (state.subCategoriesProducts.isEmpty) {
            return const Center(child: Text("No products found."));
          }
          return Subcategoryproductslist(products: state.subCategoriesProducts);
        }
        return const SizedBox.shrink(); // حالة افتراضية فارغة
      },
    );
  }
}
