import 'package:e_commerce/features/home/presentation/widgets/Home_Body.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: const CustomNavigationBar(),
      body: HomeBody(),
    );
  }
}
