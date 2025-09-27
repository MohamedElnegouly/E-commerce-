import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/presentation/widgets/Categories_row.dart';
import 'package:e_commerce/features/home/presentation/widgets/banner_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/Title.dart';
import 'package:e_commerce/features/home/presentation/widgets/image.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_list_view.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_search.dart';
import 'package:flutter/material.dart' hide Title;
class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.products});
  final List<ProductModel> products;
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
        ProductListView(products:products,),
        CenterImage(),
        // Title(title: 'New Arrival'),
        // ProductListView(products:products,),
        // Title(title: 'Smart Watch'),
        // ProductListView(products:products,),
      ],
    );
  }
}
