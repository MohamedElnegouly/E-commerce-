import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';
import 'package:meta/meta.dart';

part 'electronics_product_state.dart';

class ElectronicsProductCubit extends Cubit<ElectronicsProductState> {
  ElectronicsProductCubit(this.homeRepo) : super(ElectronicsProductInitial());
     final HomeRepo homeRepo;
   Future<void> getProducts() async {
  emit(ElectronicsProductLoading());
  var result = await homeRepo.getProducts(categoryId:'6439d2d167d9aa4ca970649f');
  result.fold(
    (failure) {
      emit(ElectronicsProductFailure(errMessage: failure.errMessage));
    },
    (menproducts) {
      emit(ElectronicsProductSuccess(electronicsProducts: menproducts));
    },
  );
}
}
