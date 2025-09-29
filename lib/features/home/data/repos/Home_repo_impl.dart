import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/Api_service.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts({
    String? categoryId,
  }) async {
    try {
      String endpoint = "products";
      if (categoryId != null) {
        endpoint += "?category=$categoryId";
      }

      var data = await apiService.get(endPoint: endpoint);
      List<ProductModel> products = [];
      for (var item in data['data']) {
        products.add(ProductModel.fromJson(item));
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategory() async {
    try{
      var data = await apiService.get(endPoint:'categories/');
      List<CategoryModel> category = [];
      for (var item in data['data']) {
        category.add(CategoryModel.fromJson(item));
      }
      return right(category);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
