import 'package:e_commerce/core/widgets/base_lower_widgets.dart';
import 'package:e_commerce/features/category/presentation/widgets/category_details_widget.dart';
import 'package:flutter/material.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key, this.initialCategoryId});
final String? initialCategoryId;
  @override
  Widget build(BuildContext context) {
    return BaseSearchScreen(lowerContent: StaticCategoryScreen( initialCategoryId: initialCategoryId,));
  }
}
