import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home/data/model/category/categoryModel.dart';
import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts({String? categoryId});
  Future<Either<Failure, List<CategoryModel>>> getCategory();
}
