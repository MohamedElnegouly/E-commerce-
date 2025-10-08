import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoriesLeftList extends StatelessWidget {
  const CategoriesLeftList({
    super.key,
    required this.dummyCategories,
    required this.size,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  final List<CategoryModel> dummyCategories;
  final Size size;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight, // ✅ بياخد الارتفاع المتاح فقط
          child: Container(
            color: Colors.grey.shade100,
            child: ListView.builder(
              itemCount: dummyCategories.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return InkWell(
                  onTap: () => onCategorySelected(index),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected
                          ? AppColors.primary
                          : Colors.transparent,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: Center(
                      child: Text(
                        dummyCategories[index].name ?? 'Category name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? AppColors.white
                              : AppColors.darkBlue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
