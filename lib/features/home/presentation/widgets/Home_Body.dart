import 'package:e_commerce/core/widgets/base_lower_widgets.dart';
import 'package:e_commerce/features/home/presentation/widgets/lower_Widgets_Home.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseSearchScreen(lowerContent: LowerWidgetsHome());
  }
}
