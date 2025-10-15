import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:meta/meta.dart';
part 'favorite_screen_state.dart';

class FavoriteScreenCubit extends Cubit<FavoriteScreenState> {
  FavoriteScreenCubit() : super(FavoriteScreenInitial());
  
  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => List.unmodifiable(_favorites);

  void toggleFavorite(ProductModel product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    emit(FavoritesUpdated(List.unmodifiable(_favorites)));
  }

  bool isFavorite(ProductModel product) {
    return _favorites.contains(product);
  }
}
