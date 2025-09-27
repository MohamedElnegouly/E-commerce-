import 'package:e_commerce/features/home/presentation/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(automaticallyImplyLeading: false, title: customappbar()),
      body: HomeScreenBody(),
    );
  }
}
