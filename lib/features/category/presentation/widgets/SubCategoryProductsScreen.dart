import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:e_commerce/features/category/presentation/manager/cubit/sub_categories_peoducts_cubit.dart';
import 'package:e_commerce/features/category/presentation/widgets/subCategoriesProductsListview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryProductsScreen extends StatelessWidget {
  const SubCategoryProductsScreen({
    super.key,
    required this.subCategoryId,
    required this.subCategoryName,
  });
  final String subCategoryId;
  final String subCategoryName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SubCategoriesPeoductsCubit(getIt.get<CategoriesRepo>())
            ..getSubCategoriesProducts(
              subCategoryId: subCategoryId,
            ), // ✅ تحميل المنتجات هنا
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primary,
            ),
            onPressed: () {
              Navigator.pop(context); // 🔙 يرجع للصفحة السابقة (Categories)
            },
          ),
          title: Text(subCategoryName),
          foregroundColor: AppColors.darkBlue,
          elevation: 1,
        ),
        body: Subcategoriesproductslistview(),
      ),
    );
  }
}
