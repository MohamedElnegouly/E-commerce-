import 'package:e_commerce/core/widgets/Second_app_Bar.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAndcardAppBar(context, 'Cart', false),
      body: Center(child: Text('Cart Screen')),
    );
  }
}
