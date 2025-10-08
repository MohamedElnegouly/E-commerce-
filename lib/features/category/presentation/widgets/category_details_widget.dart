import 'package:e_commerce/features/category/presentation/manager/cubit/category_screen_cubit.dart';
import 'package:e_commerce/features/category/presentation/widgets/categories_right_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/categories_left_list.dart';

class StaticCategoryScreen extends StatefulWidget {
  const StaticCategoryScreen({super.key});

  @override
  State<StaticCategoryScreen> createState() => _StaticCategoryScreenState();
}

class _StaticCategoryScreenState extends State<StaticCategoryScreen> {
  int selectedIndex = 0;
  String? parentCategoryName;
  String? parentCategoryImage;
  bool _initialized = false; // ✅ عشان نمنع التحميل التلقائي أكثر من مرة

  @override
  void initState() {
    super.initState();
    context.read<CategoryScreenCubit>().getCategory(); // 🟢 أول تحميل للكاتيجوري
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SizedBox(
        height: size.height,
        child: Row(
          children: [
            // 🟦 القائمة اليسار
            Expanded(
              flex: 3,
              child: BlocBuilder<CategoryScreenCubit, CategoryScreenState>(
                buildWhen: (prev, curr) =>
                    curr is CategoryScreenSuccess || curr is CategoryScreenFailure,
                builder: (context, state) {
                  if (state is CategoryScreenLoading && parentCategoryName == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoryScreenFailure) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  }

                  if (state is CategoryScreenSuccess) {
                    final allCategories = state.categories;

                    // ✅ تحميل أول كاتيجوري تلقائيًا لمرة واحدة فقط
                    if (!_initialized && allCategories.isNotEmpty) {
                      _initialized = true;
                      selectedIndex = 0;
                      parentCategoryName = allCategories[0].name;
                      parentCategoryImage = allCategories[0].image;
                      Future.microtask(() {
                        context
                            .read<CategoryScreenCubit>()
                            .getCategory(categoryId: allCategories[0].id);
                      });
                    }

                    return CategoriesLeftList(
                      dummyCategories: allCategories,
                      size: size,
                      selectedIndex: selectedIndex,
                      onCategorySelected: (index) {
                        setState(() {
                          selectedIndex = index;
                          parentCategoryName = allCategories[index].name;
                          parentCategoryImage = allCategories[index].image;
                        });

                        context
                            .read<CategoryScreenCubit>()
                            .getCategory(categoryId: allCategories[index].id);
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),

            // 🟨 الجزء اليمين
            Expanded(
              flex: 7,
              child: BlocBuilder<CategoryScreenCubit, CategoryScreenState>(
                buildWhen: (prev, curr) =>
                    curr is SubCategoryLoaded ||
                    curr is CategoryScreenLoading ||
                    curr is CategoryScreenFailure,
                builder: (context, state) {
                  if (state is CategoryScreenLoading && parentCategoryName != null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoryScreenFailure) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  }

                  if (state is SubCategoryLoaded) {
                    return CategoriesRightList(
                      categoryName: parentCategoryName ?? "Category",
                      bannerImage: parentCategoryImage ?? "",
                      subCategories: state.subCategories,
                    );
                  }

                  return const Center(
                    child: Text(
                      "Select a category to view subcategories",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
