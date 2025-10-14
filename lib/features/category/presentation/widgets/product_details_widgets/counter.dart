import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final int unitPrice; // سعر القطعة الواحدة

  const Counter({super.key, required this.unitPrice});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // نحسب السعر الكلي
    final totalPrice = widget.unitPrice * quantity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // السعر الكلي
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Price',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1,
                letterSpacing: -0.17,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'EGP ${totalPrice.toString()}',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1,
                letterSpacing: -0.17,
              ),
            ),
          ],
        ),

        const SizedBox(width: 40),

        // عداد الكمية
        Container(
          width: 122,
          height: 42,
          decoration: ShapeDecoration(
            color: const Color(0xFF004182),
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
    );
  }
}
