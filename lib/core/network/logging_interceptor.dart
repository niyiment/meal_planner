
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger logger;

  LoggingInterceptor(this.logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('Request=> Method: ${options.method}, URI: ${options.uri} BODY: ${_formatData(options.data)}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('Response=> URI: ${response.requestOptions.uri}, Status: ${response.statusCode}, Data: ${_formatData(response.data)}, ');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('''
        Error=> URI: ${err.requestOptions.uri}, TYPE: ${err.type},
        Error Code: ${err.response?.statusCode}, Error: ${err.message}, Error Details: ${_formatData(err.response?.data)}
        ''');
    super.onError(err, handler);
  }

  String _formatData(dynamic data) {
    if (data == null) return ' | (empty)';
    final dataStr = data.toString();
    if (dataStr.length <= 500) return dataStr;
    if (dataStr.length > 500) {
      return '| ${dataStr.substring(0, 500)}...\n| (truncated)';
    }
    return dataStr.split('\n').map((line) => '| $line').join('\n');
  }
}