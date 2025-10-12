import 'package:e_commerce/features/category/presentation/manager/cubit/category_screen_cubit.dart';
import 'package:e_commerce/features/category/presentation/widgets/categories_right_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/categories_left_list.dart';

class StaticCategoryScreen extends StatefulWidget {
  const StaticCategoryScreen({super.key, this.initialCategoryId});
  final String? initialCategoryId;

  @override
  State<StaticCategoryScreen> createState() => _StaticCategoryScreenState();
}

class _StaticCategoryScreenState extends State<StaticCategoryScreen> {
  int selectedIndex = 0;
  String? parentCategoryName;
  String? parentCategoryImage;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // 🟢 تحميل قائمة الفئات الرئيسية أول مرة فقط
    context.read<CategoryScreenCubit>().getCategory();
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
                    curr is CategoryScreenSuccess ||
                    curr is CategoryScreenFailure,
                builder: (context, state) {
                  if (state is CategoryScreenLoading &&
                      parentCategoryName == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoryScreenFailure) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  }

                  if (state is CategoryScreenSuccess) {
                    final allCategories = state.categories;

                    // ✅ التحميل التلقائي لأول أو Initial Category
                    if (!_initialized && allCategories.isNotEmpty) {
                      _initialized = true;

                      // نبحث عن الـ ID اللي جاي من الهوم
                      final initialIndex = widget.initialCategoryId != null
                          ? allCategories.indexWhere(
                              (c) => c.id == widget.initialCategoryId,
                            )
                          : 0;

                      selectedIndex =
                          (initialIndex >= 0) ? initialIndex : 0;
                      parentCategoryName =
                          allCategories[selectedIndex].name;
                      parentCategoryImage =
                          allCategories[selectedIndex].image;

                      // نستخدم microtask لتفادي setState أثناء build
                      Future.microtask(() {
                        if (mounted) {
                          context.read<CategoryScreenCubit>().getCategory(
                                categoryId:
                                    allCategories[selectedIndex].id,
                              );
                        }
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
                          parentCategoryImage =
                              allCategories[index].image;
                        });

                        context.read<CategoryScreenCubit>().getCategory(
                              categoryId: allCategories[index].id,
                            );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),

            // 🟨 الجزء اليمين (SubCategories)
            Expanded(
              flex: 7,
              child: BlocBuilder<CategoryScreenCubit, CategoryScreenState>(
                buildWhen: (prev, curr) =>
                    curr is SubCategoryLoaded ||
                    curr is CategoryScreenLoading ||
                    curr is CategoryScreenFailure,
                builder: (context, state) {
                  if (state is CategoryScreenLoading &&
                      parentCategoryName != null) {
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
