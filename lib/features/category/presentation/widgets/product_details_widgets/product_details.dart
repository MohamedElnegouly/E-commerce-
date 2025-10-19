import 'package:e_commerce/core/widgets/Second_app_Bar.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/add_to_card.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/counter.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/description.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/product_details_images.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/sold_and_rating.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/title_price.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAndcardAppBar(context, 'Product Details', true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          ProductDetailsImages(imageUrls: widget.product.images),
          SizedBox(height: 24),
          TitlePrice(title: widget.product.title!, price: widget.product.price),
          SizedBox(height: 16),
          SoldAndRating(
            sold: widget.product.sold,
            ratingsAverage: widget.product.ratingsAverage,
            ratingsQuantity: widget.product.ratingsQuantity,
          ),
          SizedBox(height: 16),
          Description(description: widget.product.description!),
          SizedBox(height: 16),
          Counter(
            unitPrice: widget.product.price,
            initialQuantity: selectedQuantity, // 👈 هنا نمررها
            onQuantityChanged: (newQuantity) {
              setState(() {
                selectedQuantity = newQuantity;
              });
            },
          ),
          SizedBox(height: 16),
          AddToCartButton(product: widget.product, quantity: selectedQuantity),
        ],
      ),
    );
  }
}
