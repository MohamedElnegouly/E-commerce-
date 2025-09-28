import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';
import 'package:meta/meta.dart';

part 'men_product_state.dart';

class MenProductCubit extends Cubit<MenProductState> {
  MenProductCubit(this.homeRepo) : super(MenProductInitial());
   final HomeRepo homeRepo;
   Future<void> getProducts() async {
  emit(MenProductLoading());
  var result = await homeRepo.getProducts(categoryId:'6439d5b90049ad0b52b90048');
  result.fold(
    (failure) {
      emit(MenProductfailure(errorMessage: failure.errMessage));
    },
    (menproducts) {
      emit(MenProductSuccess(menproducts: menproducts));
    },
  );
}

}
