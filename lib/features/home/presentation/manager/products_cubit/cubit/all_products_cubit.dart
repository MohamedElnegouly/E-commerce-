import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.homeRepo) : super(AllProductsInitial());
 final HomeRepo homeRepo;
 Future<void> getProducts() async {
  emit(AllProductsLoading());
  var result = await homeRepo.getProducts(categoryId:'6439d58a0049ad0b52b9003f');
  result.fold(
    (failure) {
      emit(AllProductsfailure(errorMessage: failure.errMessage));
    },
    (products) {
      emit(AllProductsSuccess(products: products));
    },
  );
}

}
