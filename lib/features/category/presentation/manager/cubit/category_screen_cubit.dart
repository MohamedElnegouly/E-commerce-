import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:meta/meta.dart';

part 'category_screen_state.dart';

class CategoryScreenCubit extends Cubit<CategoryScreenState> {
  CategoryScreenCubit(this.categoriesRepo) : super(CategoryScreenInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getCategory({String? categoryId}) async {
    // ✅ نبدأ بحالة التحميل
    emit(CategoryScreenLoading());

    try {
      final result = await categoriesRepo.getCategory(categoryId: categoryId);

      // ✅ بعد ما ترجع النتيجة، نتأكد إن الكيوبت لسه شغال
      if (isClosed) return;

      result.fold(
        (failure) {
          if (!isClosed) {
            emit(CategoryScreenFailure(errorMessage: failure.errMessage));
          }
        },
        (categories) {
          if (!isClosed) {
            if (categoryId == null) {
              emit(CategoryScreenSuccess(categories: categories));
            } else {
              emit(SubCategoryLoaded(subCategories: categories));
            }
          }
        },
      );
    } catch (e) {
      // ✅ لو حصل Exception غير متوقع
      if (!isClosed) {
        emit(CategoryScreenFailure(errorMessage: e.toString()));
      }
    }
  }
}
