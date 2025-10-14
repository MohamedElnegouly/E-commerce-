import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SoldAndRating extends StatelessWidget {
  const SoldAndRating({super.key, this.sold, this.ratingsAverage, this.ratingsQuantity});
  final num? sold;
 final num? ratingsAverage;
final int? ratingsQuantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 102,
            height: 34,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: const Color(0x4C004182),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 8,
                  child: Text(
                    '$sold Sold',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                      letterSpacing: -0.17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              Icon(CupertinoIcons.star_fill, size: 20, color: Colors.amber),
              SizedBox(width: 4),
              Text(ratingsAverage.toString(), textAlign: TextAlign.center, style: textStyle()),
              Text('($ratingsQuantity)', textAlign: TextAlign.center, style: textStyle()),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle textStyle() {
    return TextStyle(
      color: AppColors.darkBlue,
      fontSize: 18,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.29,
      letterSpacing: -0.17,
    );
  }
}
