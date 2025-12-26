
import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _handleDioError(err);

    // Convert DioException to custom AppException
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: exception,
        message: exception.message,
      ),
    );
  }

  AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        return const NoInternetException();

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response?.statusCode);

      case DioExceptionType.cancel:
        return const NetworkException('Request was cancelled');

      case DioExceptionType.unknown:
        if (error.error.toString().contains('SocketException')) {
          return const NoInternetException();
        }
        return NetworkException(
          error.message ?? 'Unknown network error',
          originalError: error.error,
        );

      default:
        return NetworkException(
          error.message ?? 'Network error occurred',
          originalError: error.error,
        );
    }
  }

  AppException _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const BadRequestException();
      case 401:
        return const UnauthorizedException();
      case 404:
        return const NotFoundException();
      case 429:
        return const RateLimitException();
      case 500:
      case 502:
      case 503:
      case 504:
        return const ServerException();
      default:
        return ApiException(
          'Request failed with status code: $statusCode',
          statusCode: statusCode,
        );
    }
  }
}
