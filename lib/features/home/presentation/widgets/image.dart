import 'package:flutter/material.dart';

class CenterImage extends StatelessWidget {
  const CenterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Frame 17.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
