import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController controller; // Controller for Search Input
  final VoidCallback? onClear; // CallBack for clear button
  final ValueChanged<String>? onSubmitted; // Call Back for submit action

  const CustomSearch({
    super.key,
    required this.controller,
    this.onClear,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              cursorColor: AppColors.darkBlue, // لون المؤشر
              cursorWidth: 2, // عرضه
              cursorHeight: 20, // ارتفاعه
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search, color: AppColors.primary),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: onClear,
                      )
                    : null,
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.70),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.primary, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Color(0xFF004182),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Icon(
            CupertinoIcons.shopping_cart,
            size: 27,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
