part of 'favorite_screen_cubit.dart';

@immutable
sealed class FavoriteScreenState {}

final class FavoriteScreenInitial extends FavoriteScreenState {}
class FavoritesUpdated extends FavoriteScreenState {
  final List<ProductModel> favorites;
  FavoritesUpdated(this.favorites);
}