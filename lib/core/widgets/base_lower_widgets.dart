import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_search.dart';
import 'package:e_commerce/features/home/presentation/manager/products_cubit/cubit/all_products_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/Custom_Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseSearchScreen extends StatefulWidget {
  final Widget lowerContent;

  const BaseSearchScreen({super.key, required this.lowerContent});

  @override
  State<BaseSearchScreen> createState() => _BaseSearchScreenState();
}

class _BaseSearchScreenState extends State<BaseSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      context.read<AllProductsCubit>().filterProducts(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomAppBar(),
        CustomSearch(
          controller: _searchController,
          onClear: () {
            _searchController.clear();
            context.read<AllProductsCubit>().filterProducts('');
          },
        ),
        const SizedBox(height: 16),

        BlocBuilder<AllProductsCubit, AllProductsState>(
          builder: (context, state) {
            if (state is AllProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AllProductsfailure) {
              return Center(child: Text(state.errorMessage));
            } else if (state is AllProductsSuccess) {
              // هنا الجزء المتغير
              return widget.lowerContent;
            } else if (state is AllProductsFiltered) {
              if (state.filteredproducts.isEmpty) {
                return Center(
                  child: Text(
                    "No Products Found",
                    style: TextStyle(color: AppColors.darkBlue),
                  ),
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.filteredproducts.length,
                itemBuilder: (context, index) {
                  final product = state.filteredproducts[index];
                  return CustomProduct(product: product);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
