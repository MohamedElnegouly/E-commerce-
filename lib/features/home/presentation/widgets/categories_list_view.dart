import 'package:e_commerce/features/home/presentation/manager/category_cubit/cubit/category_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryFailure) {
          return Text("Error: ${state.errorMessage}");
        }
        if (state is CategorySuccess) {
          final allCategories = state.categories;
          final visibleCategories = state.showAll
              ? allCategories
              : allCategories.take(6).toList(); // صفين بس

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemCount: visibleCategories.length,
            itemBuilder: (context, index) {
              final category = visibleCategories[index];
              return CategoryElement(category: category);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
