part of 'men_product_cubit.dart';

@immutable
sealed class MenProductState {}

final class MenProductInitial extends MenProductState {}

final class MenProductLoading extends MenProductState {}

final class MenProductSuccess extends MenProductState {
  final List<ProductModel> menproducts;

  MenProductSuccess({required this.menproducts});
}

final class MenProductfailure extends MenProductState {
  final String errorMessage;

  MenProductfailure({required this.errorMessage});
}
