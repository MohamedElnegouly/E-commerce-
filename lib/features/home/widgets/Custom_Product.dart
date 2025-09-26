import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة + أيقونة Favorite
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  "assets/images/Frame 65.png",
                  height: size.height * 0.18,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.blue,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),

          // النصوص + الأسعار
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Nike Air Jordon",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14, // ثابت
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Nike shoes flexible for wo gfhdfghdfg",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12, // ثابت
                  ),
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Text(
                      "EGP 1,200",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14, // ثابت
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    //   Text(
                    //     "2000 EGP",
                    //     style: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 12, // ثابت
                    //       decoration: TextDecoration.lineThrough,
                    //     ),
                    //   ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Text(
                      "Review (4.6)",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12, // ثابت
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 16,
                      child: Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
