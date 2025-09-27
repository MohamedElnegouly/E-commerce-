import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/Api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
}