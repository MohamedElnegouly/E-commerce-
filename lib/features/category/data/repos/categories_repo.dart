import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/category/data/model/subCategory/sub_category_model.dart';

abstract class CategoriesRepo {
   Future<Either<Failure, List<SubCategoryModel>>> getSubCategory({
    String? categoryId,
  });
}