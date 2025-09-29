import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerError extends Failure {
  ServerError(super.errMessage);
  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError("Conection timeOut with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerError("Send timeOut with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerError("Receive timeOut with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerError(" Bad certificate Conection");
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerError("Requist to Api server caneld");
      case DioExceptionType.connectionError:
        return ServerError("No internet Conection");
      case DioExceptionType.unknown:
        return ServerError("Un expected error please try again");
    }
  }

  factory ServerError.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError('Your response not found , please try later! ');
    } else if (statusCode == 500) {
      return ServerError('internal server error, please try later! ');
    } else {
      return ServerError('Oops there was an error  , please try again');
    }
  }
}