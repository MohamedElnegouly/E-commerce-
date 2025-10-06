import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/category/data/model/subCategory/sub_category_model.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:meta/meta.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit(this.categoriesRepo) : super(SubCategoryInitial());
  final CategoriesRepo categoriesRepo;
  Future<void> getSubCategories() async {
    emit(SubCategoryLoading());
    var result = await categoriesRepo.getSubCategory();
     result.fold(
      (failure) {
        emit(SubCategoryFailure(errMessage: failure.errMessage));
      },
      (subCategories) {
        emit(SubCategorySuccess(subCategories: subCategories));
      },
    );
  }
}
