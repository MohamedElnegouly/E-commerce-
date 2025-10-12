import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';

abstract class CategoriesRepo {
   Future<Either<Failure, List<CategoryModel>>> getCategory({
    String? categoryId,
  });
  Future<Either<Failure, List<ProductModel>>> getSubCategoriesProducts({
    String? subCategoryId,
  });
}