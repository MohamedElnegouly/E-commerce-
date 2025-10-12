import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:meta/meta.dart';

part 'sub_categories_peoducts_state.dart';

class SubCategoriesPeoductsCubit extends Cubit<SubCategoriesPeoductsState> {
  SubCategoriesPeoductsCubit(this.categoriesRepo) : super(SubCategoriesPeoductsInitial());
  final CategoriesRepo categoriesRepo;
  Future<void> getSubCategoriesProducts({String? subCategoryId}) async {
    emit(SubCategoriesPeoductsLoading());
    var result = await categoriesRepo.getSubCategoriesProducts(subCategoryId: subCategoryId);
    result.fold(
      (failure) {
        emit(SubCategoriesPeoductsFailure(errorMessage: failure.errMessage));
      },
      (categories) {
          emit(
           SubCategoriesPeoductsSuccess(subCategoriesProducts: categories),
          ); // ✅ لو main categories
      
      },
    );
  }
}
