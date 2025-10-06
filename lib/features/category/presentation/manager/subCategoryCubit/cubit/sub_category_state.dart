part of 'sub_category_cubit.dart';

@immutable
sealed class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

final class SubCategoryLoading extends SubCategoryState {}

final class SubCategorySuccess extends SubCategoryState {
  final List<SubCategoryModel> subCategories;
  SubCategorySuccess({required this.subCategories});
}
final class SubCategoryFailure extends SubCategoryState {
  final String errMessage;
  SubCategoryFailure({required this.errMessage});
}
