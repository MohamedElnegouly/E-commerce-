import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/presentation/widgets/Custom_Product.dart';
import 'package:flutter/material.dart';

class Subcategoryproductslist extends StatelessWidget {
  const Subcategoryproductslist({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(), // ✅ Scroll طبيعي
      shrinkWrap: true, // ✅ يخليها تاخد مساحة محتواها فقط
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ✅ عمودين
        crossAxisSpacing: 1,
        mainAxisSpacing: 5,
        childAspectRatio: 0.7, // ✅ لضبط أبعاد المنتج
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomProduct(product: products[index]);
      },
    );
  }
}
