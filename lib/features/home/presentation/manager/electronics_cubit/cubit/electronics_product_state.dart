part of 'electronics_product_cubit.dart';

@immutable
sealed class ElectronicsProductState {}

final class ElectronicsProductInitial extends ElectronicsProductState {}

final class ElectronicsProductLoading extends ElectronicsProductState {}

final class ElectronicsProductSuccess extends ElectronicsProductState {
  final List<ProductModel> electronicsProducts;

  ElectronicsProductSuccess({required this.electronicsProducts});
}

final class ElectronicsProductFailure extends ElectronicsProductState {
  final String errMessage;
  ElectronicsProductFailure({required this.errMessage});
}
