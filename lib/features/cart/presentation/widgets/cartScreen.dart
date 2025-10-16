import 'package:e_commerce/core/widgets/Second_app_Bar.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cartItemwidget.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAndcardAppBar(context, 'Cart', false),
      body: Column(
        children: [
          CartItemWidget(price: 200, quantity: 2,, onRemove: () {  }, product: null,),
        ],
      ),
    );
  }
}
