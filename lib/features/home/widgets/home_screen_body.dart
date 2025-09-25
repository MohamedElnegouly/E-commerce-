import 'package:e_commerce/core/widgets/custom_search.dart';
import 'package:e_commerce/features/home/widgets/Categories_row.dart';
import 'package:e_commerce/features/home/widgets/banner_list_view.dart';
import 'package:e_commerce/features/home/widgets/categories_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearch(),
        SizedBox(height: 16),
        BannerListView(),
        CategoriesRow(),
        CategoriesListView(),
        CategoriesListView(),
      ],
    );
  }
}
