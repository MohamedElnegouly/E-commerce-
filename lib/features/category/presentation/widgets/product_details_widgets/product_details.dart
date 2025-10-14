import 'package:e_commerce/core/widgets/Second_app_Bar.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/product_details_images.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAndcardAppBar('Product Details'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          ProductDetailsImages(),
          SizedBox(height: 24),         
        ],
      ),
    );
  }
}
