import 'package:equatable/equatable.dart';
import 'exceptions.dart';

/// Sealed class for Result type (Success or Failure)
sealed class Result<T> extends Equatable {
  const Result();

  /// Returns true if this is a Success
  bool get isSuccess => this is Success<T>;

  /// Returns true if this is a Failure
  bool get isFailure => this is Failure<T>;

  /// Get the success value or null
  T? get dataOrNull => switch (this) {
    Success(value: final data) => data,
    Failure() => null,
  };

  /// Get the failure exception or null
  AppException? get exceptionOrNull => switch (this) {
    Success() => null,
    Failure(exception: final error) => error,
  };

  /// Execute different callbacks based on result type
  R when<R>({
    required R Function(T data) success,
    required R Function(AppException exception) failure,
  }) {
    return switch (this) {
      Success(value: final data) => success(data),
      Failure(exception: final error) => failure(error),
    };
  }

  /// Map the success value
  Result<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      Success(value: final data) => Success(transform(data)),
      Failure(exception: final error) => Failure(error),
    };
  }

  /// FlatMap for chaining operations
  Result<R> flatMap<R>(Result<R> Function(T data) transform) {
    return switch (this) {
      Success(value: final data) => transform(data),
      Failure(exception: final error) => Failure(error),
    };
  }

  @override
  List<Object?> get props => switch (this) {
    Success(value: final data) => [data],
    Failure(exception: final error) => [error],
  };
}

/// Success result containing data
final class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);

  @override
  String toString() => 'Success(value: $value)';
}

/// Failure result containing an exception
final class Failure<T> extends Result<T> {
  final AppException exception;

  const Failure(this.exception);

  @override
  String toString() => 'Failure(exception: $exception)';
}



