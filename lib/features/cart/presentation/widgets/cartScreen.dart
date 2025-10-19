import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/Second_app_Bar.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cartItemwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAndcardAppBar(context, 'Cart', false),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final items = cartCubit.cartItems;
          if (items.isEmpty) {
            return const Center(
              child: Text(
                "🛒 Your cart is empty",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartItemWidget(
                      price: item.price,
                      onRemove: () {
                        context.read<CartCubit>().removeFromCart(item.id!);
                      },
                      product: item, // أو ابني الـ ProductModel هنا لو محتاج
                    );
                  },
                ),
              ),

              /// 🔹 الإجمالي أسفل الصفحة
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:",
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BlocSelector<CartCubit, CartState, num>(
                      selector: (state) => context.read<CartCubit>().totalPrice,
                      builder: (context, total) {
                        return Text(
                          '$total EGP',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
