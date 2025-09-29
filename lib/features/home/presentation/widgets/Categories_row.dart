import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/presentation/manager/category_cubit/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoryCubit, CategoryState, bool>(
      selector: (state) {
        if (state is CategorySuccess) return state.showAll;
        return false;
      },
      builder: (context, showAll) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.read<CategoryCubit>().toggleShowAll(); //call the method to toggle the value
                },
                child: Text(
                  showAll ? "See Less" : "See All",
                  style: const TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
