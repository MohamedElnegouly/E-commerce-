import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StaticCategoryScreen extends StatefulWidget {
  const StaticCategoryScreen({super.key});

  @override
  State<StaticCategoryScreen> createState() => _StaticCategoryScreenState();
}

class _StaticCategoryScreenState extends State<StaticCategoryScreen> {
  int selectedIndex = 0;

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
        {"name": "T-Shirts", "image": "https://via.placeholder.com/150"},
        {"name": "Jeans", "image": "https://via.placeholder.com/150"},
        {"name": "Jackets", "image": "https://via.placeholder.com/150"},
      ],
    },
    {
      "name": "Kids",
      "image": "https://via.placeholder.com/300x120",
      "subs": [
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
      height: size.height * 0.8,
      child: IntrinsicHeight(
        child: Row(
          children: [
            // 🟦 الجزء الأيسر (قائمة التصنيفات)
            Container(
              width: size.width * 0.25,
              color: Colors.grey.shade100,
              child: ListView.builder(
                itemCount: dummyCategories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return InkWell(
                    onTap: () => setState(() => selectedIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      color: isSelected ? Colors.white : Colors.transparent,
                      child: Center(
                        child: Text(
                          dummyCategories[index]["name"],
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected ? Colors.blue : Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // 🟨 الجزء الأيمن (تفاصيل التصنيف)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة Banner
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: category["image"],
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/Frame 65.png"),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // اسم التصنيف
                  Text(
                    category["name"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Grid للفئات الفرعية
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: (category["subs"] as List).length,
                    itemBuilder: (context, index) {
                      final sub = category["subs"][index];
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: sub["image"],
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/Ellipse 14.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            sub["name"],
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
