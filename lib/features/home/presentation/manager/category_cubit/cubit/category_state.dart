part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;
  final bool showAll;
  CategorySuccess({
    required this.categories,
    this.showAll = false, // افتراضي يعرض أول صفين بس
  });

  CategorySuccess copyWith({List<CategoryModel>? categories, bool? showAll}) {
    return CategorySuccess(
      categories: categories ?? this.categories,
      showAll: showAll ?? this.showAll,
    );
  }
}

final class CategoryFailure extends CategoryState {
  final String errorMessage;
  CategoryFailure({required this.errorMessage});
}
