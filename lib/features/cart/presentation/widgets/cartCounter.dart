import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/cart/data/model/cart_model.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartcounter extends StatefulWidget {
  final CartModel cartItem;
  // سعر القطعة الواحدة
  const Cartcounter({super.key, required this.cartItem});
  @override
  State<Cartcounter> createState() => _CounterState();
}

class _CounterState extends State<Cartcounter> {
  late int quantity; // نعرف المتغير هنا

  @override
  void initState() {
    super.initState();
    // نحط القيمة هنا في initState عشان تتحدد أول ما الودجت يتبني
    quantity = widget.cartItem.quantity;
  }

  void increment() {
    setState(() {
      quantity++;
      context.read<CartCubit>().increaseQuantity(widget.cartItem.id);
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        context.read<CartCubit>().decreaseQuantity(widget.cartItem.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // نحسب السعر الكلي
    final totalPrice = widget.cartItem.price! * quantity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "EGP ${totalPrice.toString()}",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        // زرار النقصان
        Spacer(),
        Container(
          width: 122,
          height: 42,
          decoration: ShapeDecoration(
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.minus,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: decrement,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              // العدد الحالي
              Text(
                '$quantity',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 1,
                  letterSpacing: -0.17,
                ),
              ),

              // زرار الزيادة
              IconButton(
                icon: const Icon(
                  CupertinoIcons.plus,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: increment,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
