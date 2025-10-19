import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/category/presentation/widgets/product_details_widgets/total_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final num? unitPrice;
  final int initialQuantity; // 👈 الكمية اللي نبدأ بيها
  final ValueChanged<int>? onQuantityChanged;

  const Counter({
    super.key,
    this.unitPrice,
    this.onQuantityChanged,
    this.initialQuantity = 1, // 👈 القيمة الافتراضية
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    // نبدأ بالكمية اللي جاية من الخارج
    quantity = widget.initialQuantity;
  }

  void increment() {
    setState(() {
      quantity++;
      widget.onQuantityChanged?.call(quantity);
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        widget.onQuantityChanged?.call(quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = (widget.unitPrice ?? 0) * quantity;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // السعر الكلي
          TotalPriceWidget(totalPrice: totalPrice),
          const Spacer(),
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
                // زرار النقصان
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
      ),
    );
  }
}
