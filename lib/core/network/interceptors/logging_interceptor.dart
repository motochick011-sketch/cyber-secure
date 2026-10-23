import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../logging/logger.dart';
import '../api_routes.dart';

@lazySingleton
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor(this._logger);

  final Logger _logger;

  bool _isLogEndpoint(RequestOptions o) => o.uri.path.endsWith(ApiRoutes.logs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_isLogEndpoint(options)) {
      _logger.debug('→ ${options.method} ${options.uri.path}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!_isLogEndpoint(response.requestOptions)) {
      _logger.debug('← ${response.statusCode} ${response.requestOptions.uri.path}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!_isLogEndpoint(err.requestOptions)) {
      _logger.warn('✗ ${err.response?.statusCode ?? '-'} ${err.requestOptions.uri.path}', err.message);
    }
    handler.next(err);
  }
}
