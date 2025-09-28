import 'package:e_commerce/features/home/presentation/widgets/Categories_row.dart';
import 'package:e_commerce/features/home/presentation/widgets/banner_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/Title.dart';
import 'package:e_commerce/features/home/presentation/widgets/elecProductListCubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/image.dart';
import 'package:e_commerce/features/home/presentation/widgets/menProductsListCubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/womenProductsListCubit.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_search.dart';
import 'package:flutter/material.dart' hide Title;

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
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
        Title(title: 'Women Fashion'),
        Womenproductslistcubit(),
        CenterImage(),
        Title(title: 'Men\'s Clothing'),
        Menproductslistcubit(),
         Title(title: 'Electronics'),
         Elecproductlistcubit(),
      ],
    );
  }
}
