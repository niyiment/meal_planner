import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:meal_planner/core/constants/app_constant.dart';
import 'package:meal_planner/core/network/logging_interceptor.dart';

import 'error_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: AppConstants.connectionTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Add interceptors
  dio.interceptors.addAll([
    LoggingInterceptor(ref.read(loggerProvider)),
    ErrorInterceptor(),
  ]);

  return dio;
});

final loggerProvider = Provider<Logger>((ref) {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
});

final openAiDioProvider = Provider<Dio>((ref) {
  final dio = ref.read(dioProvider);
  dio.options.baseUrl = AppConstants.openAiBaseUrl;
  return dio;
});

