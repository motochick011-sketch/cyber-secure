import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../token_provider.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(this._tokens);

  final TokenProvider _tokens;

  void Function()? onSessionExpired;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(await _tokens.authHeaders());
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshed = await _tokens.refresh();
    if (!refreshed) {
      await _tokens.clear();
      onSessionExpired?.call();
      return handler.next(err);
    }

    try {
      final retryDio = Dio(BaseOptions(baseUrl: err.requestOptions.baseUrl));
      final opts = err.requestOptions;
      opts.headers.addAll(await _tokens.authHeaders());
      final response = await retryDio.fetch<dynamic>(opts);
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }
}
