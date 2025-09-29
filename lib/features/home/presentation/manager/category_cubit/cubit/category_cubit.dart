import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());
  final HomeRepo homeRepo;
  Future<void> getCategory() async {
    emit(CategoryLoading());
    var result = await homeRepo.getCategory();
    result.fold(
      (failure) {
        emit(CategoryFailure(errorMessage: failure.errMessage));
      },
      (categories) {
        emit(CategorySuccess(categories: categories));
      },
    );
  }
  void toggleShowAll() {
    if (state is CategorySuccess) {
      final currentState = state as CategorySuccess;
      emit(currentState.copyWith(showAll: !currentState.showAll));
    }
  }
}
