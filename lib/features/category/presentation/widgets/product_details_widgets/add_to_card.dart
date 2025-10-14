import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: (){},
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
