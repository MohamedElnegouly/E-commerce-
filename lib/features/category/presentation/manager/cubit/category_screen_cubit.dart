import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:meta/meta.dart';

part 'category_screen_state.dart';

class CategoryScreenCubit extends Cubit<CategoryScreenState> {
  CategoryScreenCubit(this.categoriesRepo) : super(CategoryScreenInitial());
  final CategoriesRepo categoriesRepo;
  Future<void> getCategory({String? categoryId}) async {
    emit(CategoryScreenLoading());
    var result = await categoriesRepo.getSubCategory(categoryId: categoryId);
    result.fold(
      (failure) {
        emit(CategoryScreenFailure(errorMessage: failure.errMessage));
      },
      (categories) {
        if (categoryId == null) {
          emit(
            CategoryScreenSuccess(categories: categories),
          ); // ✅ لو main categories
        } else {
          emit(
            SubCategoryLoaded(subCategories: categories),
          ); // ✅ لو subcategories
        }
      },
    );
  }
}
