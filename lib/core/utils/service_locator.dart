import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/Api_service.dart';
import 'package:e_commerce/features/Authentication/data/repo/auth_repo.dart';
import 'package:e_commerce/features/Authentication/data/repo/auth_repo_impl.dart';
import 'package:e_commerce/features/Authentication/presentation/manager/cubit/cubit/auth_cubit.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo.dart';
import 'package:e_commerce/features/category/data/repos/categories_repo_imp.dart';
import 'package:e_commerce/features/category/presentation/manager/cubit/category_screen_cubit.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo.dart';
import 'package:e_commerce/features/home/data/repos/Home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CategoriesRepo>(CategoriesRepoImp( getIt.get<ApiService>()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory(
    () => CategoryScreenCubit(getIt.get<CategoriesRepo>()),
  );
  getIt.registerFactory(() => AuthCubit(getIt.get<AuthRepo>()));

}

