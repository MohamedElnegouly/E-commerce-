import 'package:e_commerce/features/cart/data/model/cart_model.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddToCartButton extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  const AddToCartButton({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () {
          final cartItem = CartModel.fromProduct(product , quantity);
          context.read<CartCubit>().addToCart(cartItem);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF004182),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3,
        ),
        icon: const Icon(
          CupertinoIcons.cart_fill,
          color: Colors.white,
          size: 22,
        ),
        label: const Text(
          'Add to cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}
