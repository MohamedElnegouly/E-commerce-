import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';

abstract class CategoriesRepo {
   Future<Either<Failure, List<CategoryModel>>> getSubCategory({
    String? categoryId,
  });
}