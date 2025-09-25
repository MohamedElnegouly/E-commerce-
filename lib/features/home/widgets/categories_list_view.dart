import 'package:e_commerce/features/home/widgets/category_element.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const CategoryElement();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
      ),
    );
  }
}
