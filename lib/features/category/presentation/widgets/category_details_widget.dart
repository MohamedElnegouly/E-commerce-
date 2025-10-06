import 'package:e_commerce/features/category/presentation/widgets/categories_right_list.dart';
import 'package:flutter/material.dart';
import '../widgets/categories_left_list.dart';

class StaticCategoryScreen extends StatefulWidget {
  const StaticCategoryScreen({super.key});

  @override
  State<StaticCategoryScreen> createState() => _StaticCategoryScreenState();
}

class _StaticCategoryScreenState extends State<StaticCategoryScreen> {
  int selectedIndex = 0;
  String image = "https://picsum.photos/300/120";
  final List<Map<String, dynamic>> dummyCategories = [
    {
      "name": "Women",
      "image": "https://via.placeholder.com/300x120",
      "subs": [
        {"name": "Dresses", "image": "https://via.placeholder.com/150"},
        {"name": "Shoes", "image": "https://via.placeholder.com/150"},
        {"name": "Bags", "image": "https://via.placeholder.com/150"},
      ],
    },
    {
      "name": "Men",
      "image": "https://via.placeholder.com/300x120",
      "subs": [
        {"name": "T-Shirts", "image": "https://picsum.photos/300/120"},
        {"name": "Jeans", "image": "https://picsum.photos/300/120"},
        {"name": "Jackets", "image": "https://picsum.photos/300/120"},
      ],
    },
    {
      "name": "Kids",
      "image": "https://via.placeholder.com/300x120",
      "subs": [
        {"name": "Toys", "image": "https://picsum.photos/300/120"},
        {"name": "Shoes", "image": "https://picsum.photos/300/120"},
        {"name": "Accessories", "image": "https://via.placeholder.com/150"},
        {"name": "Toys", "image": "https://via.placeholder.com/150"},
        {"name": "Shoes", "image": "https://via.placeholder.com/150"},
        {"name": "Accessories", "image": "https://via.placeholder.com/150"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final category = dummyCategories[selectedIndex];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8, //
      child: SafeArea(
        child: SizedBox.expand(
          child: Row(
            children: [
              // 🟦 القائمة اليسار
              SizedBox(
                width: size.width * 0.30,
                child: CategoriesLeftList(
                  dummyCategories: dummyCategories,
                  size: size,
                  selectedIndex: selectedIndex,
                  onCategorySelected: (index) {
                    setState(() => selectedIndex = index);
                  },
                ),
              ),

              // 🟨 تفاصيل التصنيف
              Expanded(child: CategoriesRightList(category: category)),
            ],
          ),
        ),
      ),
    );
  }
}
