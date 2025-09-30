import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.homeRepo) : super(AllProductsInitial());

  final HomeRepo homeRepo;
  List<ProductModel> _allProducts = [];

  Future<void> getProducts() async {
    emit(AllProductsLoading());
    var result = await homeRepo.getProducts();
    result.fold(
      (failure) {
        emit(AllProductsfailure(errorMessage: failure.errMessage));
      },
      (products) {
        _allProducts = products; // نخزن كل المنتجات
        emit(AllProductsSuccess(products: products));
      },
    );
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      emit(AllProductsSuccess(products: _allProducts));
    } else {
      final filtered = _allProducts
          .where((product) => product.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(AllProductsFiltered(filteredproducts: filtered));
    }
  }
}

