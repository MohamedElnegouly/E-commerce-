import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Row customappbar() {
  return Row(
    children: [
      SvgPicture.asset(
        'assets/images/Group 5.svg',
        width: 66,
        height: 22,
        //color: Color(0xFF004182),
      ),
    ],
  );
}
