import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/Group 5.svg',
            width: 66,
            height: 22,
            //color: Color(0xFF004182),
          ),
        ],
      ),
    );
  }
}
