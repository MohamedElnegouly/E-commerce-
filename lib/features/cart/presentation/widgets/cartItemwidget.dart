import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/cart/data/model/cart_model.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cartCounter.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final num price;
  final VoidCallback onRemove;
  final CartModel product;
  const CartItemWidget({
    super.key,
    required this.price,
    required this.onRemove,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          /// 🖼 صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: product.imageCover!,
              height: size.width * 0.25,
              width: size.width * 0.25,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/Frame 65.png",
                height: size.width * 0.25,
                width: size.width * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),

          /// 📄 تفاصيل المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 اسم المنتج + أيقونة الحذف
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.title!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBlue,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: AppColors.primary,
                        size: 22,
                      ),
                      onPressed: onRemove,
                    ),
                  ],
                ),

                /// 🎨 اللون + المقاس
                Cartcounter(cartItem: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
