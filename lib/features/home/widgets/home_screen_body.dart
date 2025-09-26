import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_search.dart';
import 'package:e_commerce/features/home/widgets/Categories_row.dart';
import 'package:e_commerce/features/home/widgets/banner_list_view.dart';
import 'package:e_commerce/features/home/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/widgets/Title.dart';
import 'package:e_commerce/features/home/widgets/image.dart';
import 'package:e_commerce/features/home/widgets/product_list_view.dart';
import 'package:flutter/material.dart' hide Title;

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAppBar(),
        CustomSearch(),
        SizedBox(height: 16),
        BannerListView(),
        CategoriesRow(),
        CategoriesListView(),
        CategoriesListView(),
        Title(title: 'Home Applicance'),
        ProductListView(),
        CenterImage(),
        Title(title: 'New Arrival'),
        ProductListView(),
        Title(title: 'Smart Watch'),
        ProductListView(),
      ],
    );
  }
}
