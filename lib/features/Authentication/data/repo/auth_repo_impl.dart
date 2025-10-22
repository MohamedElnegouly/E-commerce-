import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/Api_service.dart';
import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;
  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AuthModel>> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: "auth/signup",
        token: null,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        },
      );
      return right(AuthModel.fromJson(response));
    } on DioException catch (e) {
      return left(ServerError.fromDioError(e));
    } catch (e) {
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: "auth/signin",
        token: null,
        body: {
          "email": email,
          "password": password,
        },
      );
      return right(AuthModel.fromJson(response));
    } on DioException catch (e) {
      return left(ServerError.fromDioError(e));
    } catch (e) {
      return left(ServerError(e.toString()));
    }
  }
}
