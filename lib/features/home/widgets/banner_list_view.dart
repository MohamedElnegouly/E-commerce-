import 'package:flutter/material.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // ارتفاع العنصر
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // ✅ يخليها أفقية
        itemCount: 3,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 16), // مسافة بين العناصر
            width: 385, // عرض كل عنصر
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.antiAlias,
            child: Image.asset('assets/images/Group 11.png', fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}
