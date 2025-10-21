import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 2),
      child: Row(
        children: [
          Image.asset(
            'assets/images/matgar_logo_home.png',
            width: 50,
            height: 50,
            //color: Color(0xFF004182),
          ),
        ],
      ),
    );
  }
}
