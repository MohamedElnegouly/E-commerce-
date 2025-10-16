import 'package:e_commerce/core/widgets/Second_app_Bar.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/add_to_card.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/counter.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/description.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/product_details_images.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/sold_and_rating.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/title_price.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAndcardAppBar(context, 'Product Details' , true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          ProductDetailsImages(imageUrls: product.images),
          SizedBox(height: 24),
          TitlePrice(title: product.title!, price: product.price),
          SizedBox(height: 16),
          SoldAndRating(
            sold: product.sold,
            ratingsAverage: product.ratingsAverage,
            ratingsQuantity: product.ratingsQuantity,
          ),
          SizedBox(height: 16),
          Description(description: product.description!),
          SizedBox(height: 16),
          Counter(unitPrice: product.price),
          SizedBox(height: 16),
          AddToCartButton(),
        ],
      ),
    );
  }
}
