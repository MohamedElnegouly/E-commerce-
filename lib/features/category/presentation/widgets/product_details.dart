import 'package:e_commerce/core/widgets/Second_app_Bar.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAndcardAppBar('Product Details'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text('fghfgh'))],
      ),
    );
  }
}
