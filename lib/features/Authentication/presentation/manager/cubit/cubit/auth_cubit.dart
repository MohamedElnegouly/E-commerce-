import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/Authentication/data/model/auth_model.dart';
import 'package:e_commerce/features/Authentication/data/repo/auth_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(AuthLoading());

    final Either<Failure, AuthModel> result = await authRepo.signup(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.errMessage)),
      (response) async {
        // ✅ حفظ بيانات المستخدم في Hive
        final box = Hive.box<AuthModel>('userBox');
        await box.put('user', response);
        emit(AuthSuccess(response));
      },
    );
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final Either<Failure, AuthModel> result = await authRepo.signin(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.errMessage)),
      (response) async {
        // ✅ حفظ بيانات المستخدم في Hive
        final box = Hive.box<AuthModel>('userBox');
        await box.put('user', response);
        emit(AuthSuccess(response));
      },
    );
  }
  AuthModel? getSavedUser() {
    final box = Hive.box<AuthModel>('userBox');
    return box.get('user');
  }

  // ✅ دالة جديدة: تسجيل الخروج (مسح البيانات)
  Future<void> logout() async {
    final box = Hive.box<AuthModel>('userBox');
    await box.clear();
  }
}