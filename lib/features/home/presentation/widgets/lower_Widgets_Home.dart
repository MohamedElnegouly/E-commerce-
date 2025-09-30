import 'package:e_commerce/features/home/presentation/widgets/Categories_row.dart';
import 'package:e_commerce/features/home/presentation/widgets/Title.dart' show TitleHeadLine;
import 'package:e_commerce/features/home/presentation/widgets/banner_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/elecProductListCubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/image.dart';
import 'package:e_commerce/features/home/presentation/widgets/menProductsListCubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/presentation/widgets/womenProductsListCubit.dart';
class LowerWidgetsHome extends StatelessWidget {
  const LowerWidgetsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       SizedBox(height: 16),
        BannerListView(),
        CategoriesRow(),
        CategoriesListView(),
        TitleHeadLine(title: 'Women Fashion',),
        Womenproductslistcubit(),
        CenterImage(),
        TitleHeadLine(title: 'Men\'s Clothing'),
        Menproductslistcubit(),
        TitleHeadLine(title: 'Electronics'),
        Elecproductlistcubit(),
    ],);
  }
}