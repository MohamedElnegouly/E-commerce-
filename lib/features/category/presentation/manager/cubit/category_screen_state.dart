part of 'category_screen_cubit.dart';

@immutable
sealed class CategoryScreenState {}

final class CategoryScreenInitial extends CategoryScreenState {}

final class CategoryScreenLoading extends CategoryScreenState {}

final class CategoryScreenSuccess extends CategoryScreenState {
  final List<CategoryModel> categories;
  CategoryScreenSuccess({required this.categories});
}
class SubCategoryLoaded extends CategoryScreenState {
  final List<CategoryModel> subCategories;
  SubCategoryLoaded({required this.subCategories});
}

final class CategoryScreenFailure extends CategoryScreenState {
  final String errorMessage;
  CategoryScreenFailure({required this.errorMessage});
}


