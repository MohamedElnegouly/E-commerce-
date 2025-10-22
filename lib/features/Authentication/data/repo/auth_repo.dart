import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';

abstract class AuthRepo {
 Future<Either<Failure ,AuthModel>> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
  Future<Either<Failure, AuthModel>> signin({
    required String email,
    required String password,
  });
}
