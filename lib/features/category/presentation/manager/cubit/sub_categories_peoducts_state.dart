part of 'sub_categories_peoducts_cubit.dart';

@immutable
sealed class SubCategoriesPeoductsState {}

final class SubCategoriesPeoductsInitial extends SubCategoriesPeoductsState {}

final class SubCategoriesPeoductsLoading extends SubCategoriesPeoductsState {}

final class SubCategoriesPeoductsSuccess extends SubCategoriesPeoductsState {
  final List<ProductModel> subCategoriesProducts;
  SubCategoriesPeoductsSuccess({required this.subCategoriesProducts});
}

final class SubCategoriesPeoductsFailure extends SubCategoriesPeoductsState {
  final String errorMessage;
  SubCategoriesPeoductsFailure({required this.errorMessage});
}
