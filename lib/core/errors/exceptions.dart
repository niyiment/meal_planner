import 'package:equatable/equatable.dart';

/// Base class for all application exceptions
abstract class AppException extends Equatable implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException(this.message, {this.code, this.originalError});

  @override
  List<Object?> get props => [message, code];

  @override
  String toString() => message;
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, {super.code, super.originalError});
}

class NoInternetException extends NetworkException {
  const NoInternetException()
      : super('No internet connection. Please check your network settings.');
}

class TimeoutException extends NetworkException {
  const TimeoutException()
      : super('Request timeout. Please try again.');
}

class ServerException extends NetworkException {
  const ServerException([super.message = 'Server error occurred']);
}

/// API related exceptions
class ApiException extends AppException {
  final int? statusCode;

  const ApiException(
      super.message, {
        this.statusCode,
        super.code,
        super.originalError,
      });

  @override
  List<Object?> get props => [message, code, statusCode];
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException()
      : super('Unauthorized access', statusCode: 401);
}

class NotFoundException extends ApiException {
  const NotFoundException([super.message = 'Resource not found'])
      : super(statusCode: 404);
}

class BadRequestException extends ApiException {
  const BadRequestException([super.message = 'Invalid request'])
      : super(statusCode: 400);
}

class RateLimitException extends ApiException {
  const RateLimitException()
      : super('Rate limit exceeded. Please try again later.', statusCode: 429);
}

/// Cache related exceptions
class CacheException extends AppException {
  const CacheException([String message = 'Cache error occurred'])
      : super(message);
}

/// Parsing related exceptions
class ParseException extends AppException {
  const ParseException([super.message = 'Failed to parse data']);
}

/// Validation exceptions
class ValidationException extends AppException {
  final Map<String, String>? errors;

  const ValidationException(
      super.message, {
        this.errors,
        super.code,
      });

  @override
  List<Object?> get props => [message, code, errors];
}

/// Permission related exceptions
class PermissionException extends AppException {
  const PermissionException([super.message = 'Permission denied']);
}

class CameraPermissionException extends PermissionException {
  const CameraPermissionException()
      : super('Camera permission is required to take photos');
}

class StoragePermissionException extends PermissionException {
  const StoragePermissionException()
      : super('Storage permission is required to access photos');
}

/// AI Service exceptions
class AiServiceException extends AppException {
  const AiServiceException([super.message = 'AI service error occurred']);
}

class InvalidApiKeyException extends AiServiceException {
  const InvalidApiKeyException()
      : super('Invalid API key. Please check your configuration.');
}

class ModelUnavailableException extends AiServiceException {
  const ModelUnavailableException()
      : super('AI model is currently unavailable');
}

/// Image processing exceptions
class ImageException extends AppException {
  const ImageException([super.message = 'Image processing error']);
}

class ImageTooLargeException extends ImageException {
  const ImageTooLargeException()
      : super('Image size is too large. Please select a smaller image.');
}

class InvalidImageFormatException extends ImageException {
  const InvalidImageFormatException()
      : super('Invalid image format. Please select a valid image.');
}

/// Storage exceptions
class StorageException extends AppException {
  const StorageException([super.message = 'Storage error occurred']);
}

class StorageFullException extends StorageException {
  const StorageFullException()
      : super('Storage is full. Please free up some space.');
}

/// Unknown exception
class UnknownException extends AppException {
  const UnknownException([super.message = 'An unknown error occurred']);
}
