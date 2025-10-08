import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/Api_service.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';

class CategoriesRepoImp implements CategoriesRepo{
   final ApiService apiService;
  CategoriesRepoImp(this.apiService);
  @override
 Future<Either<Failure, List<CategoryModel>>> getSubCategory({
  String? categoryId,
}) async {
  try {
    String endpoint = "categories/";
    if (categoryId != null) {
      endpoint += "$categoryId/subcategories";
    }
    final data = await apiService.get(endPoint: endpoint);
    if (data['data'] == null) {
      return right([]);
    }
    final subCategories = (data['data'] as List)
        .map((item) => CategoryModel.fromJson(item))
        .toList();

    return right(subCategories);
  } catch (e) {
    if (e is DioException) {
      return left(ServerError.fromDioError(e));
    }
    return left(ServerError(e.toString()));
  }
}

}