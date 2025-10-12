import 'package:e_commerce/features/category/presentation/widgets/categories_body.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, this.initialCategoryId});
  final String? initialCategoryId;
  @override
  Widget build(BuildContext context) {
    return CategoriesBody(initialCategoryId: initialCategoryId);
  }
}
