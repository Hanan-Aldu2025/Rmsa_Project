import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class FailureServer extends Failure {
  FailureServer(super.errorMessage);
  factory FailureServer.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return FailureServer("connection Timeout Error");

      case DioExceptionType.sendTimeout:
        return FailureServer("send Timeout  Error");
      case DioExceptionType.receiveTimeout:
        return FailureServer("receive Timeout  Error");

      case DioExceptionType.badCertificate:
        return FailureServer("bad Certificate Timeout  Error");
      case DioExceptionType.badResponse:
        return FailureServer.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return FailureServer("Request ServerApi  Error");
      case DioExceptionType.connectionError:
        return FailureServer("connection Error");
      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return FailureServer(" No Internet  Connection");
        }
        return FailureServer("Unexpected  Error , Pleas Try Agin");
      // default:
      //   return FailureServer("Oops there was Error , Please Try later");
    }
  }

  factory FailureServer.fromResponse(int statcode, dynamic response) {
    if (statcode == 400 || statcode == 401 || statcode == 403) {
      return FailureServer(response['error']['message ']);
    } else if (statcode == 404) {
      return FailureServer("Your request was Error , Please Try later ");
    } else if (statcode == 405) {
      return FailureServer("Internal Server Error , Please Try later ");
    } else {
      return FailureServer("Oops there was Error , Please Try later ");
    }
  }
}
