import 'package:e_commerce/features/category/presentation/widgets/category_details_widget.dart';
import 'package:e_commerce/features/category/presentation/widgets/category_item.dart';
import 'package:e_commerce/features/home/presentation/manager/category_cubit/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LowerWidgetCategory extends StatefulWidget {
  const LowerWidgetCategory({super.key});

  @override
  State<LowerWidgetCategory> createState() => _LowerWidgetCategoryState();
}

class _LowerWidgetCategoryState extends State<LowerWidgetCategory> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is CategorySuccess) {
          final categories = state.categories;

          return Row(
            children: [
              // القائمة الجانبية
              Container(
                width: size.width * 0.25,
                color: Colors.grey.shade100,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      title: categories[index].name ?? '',
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() => selectedIndex = index);
                      },
                    );
                  },
                ),
              ),

              // تفاصيل التصنيف المختار
              // Expanded(
              //   child: CategoryDetailsWidget(),
              // ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
