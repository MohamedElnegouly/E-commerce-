import 'package:e_commerce/core/widgets/base_lower_widgets.dart';
import 'package:e_commerce/features/favorite/presentation/widgets/favorite_body.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSearchScreen(lowerContent:FavoriteBody() ,);
  }
}
