import 'package:e_commerce/features/favorite/presentation/manager/favorite_cubit/cubit/favorite_screen_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/Custom_Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteScreenCubit, FavoriteScreenState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteScreenCubit>();
        final favorites = cubit.favorites;
        if (favorites.isEmpty) {
          return const Center(child: Text("No favorites yet."));
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          //padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return CustomProduct(product: favorites[index]);
          },
        );
      },
    );
  }
}
