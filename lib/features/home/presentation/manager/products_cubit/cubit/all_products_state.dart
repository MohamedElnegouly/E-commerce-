part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}

final class AllProductsLoading extends AllProductsState {}

final class AllProductsSuccess extends AllProductsState {
  final List<ProductModel> products;

  AllProductsSuccess({required this.products});
}

final class AllProductsfailure extends AllProductsState {
  final String errorMessage;

  AllProductsfailure({required this.errorMessage});
}
