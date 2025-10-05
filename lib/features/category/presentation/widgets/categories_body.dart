import 'package:e_commerce/core/widgets/base_lower_widgets.dart';
import 'package:e_commerce/features/category/presentation/widgets/lower_widget_category.dart';
import 'package:flutter/material.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseSearchScreen(
      lowerContent: LowerWidgetCategory(),
    );
    //return Center(child: Text('Categories Screen'));
  }
}