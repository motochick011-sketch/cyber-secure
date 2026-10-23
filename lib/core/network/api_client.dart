import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../cache/cache_policy.dart';
import '../cache/cache_store.dart';
import '../error/app_error.dart';
import 'result.dart';

@lazySingleton
class ApiClient {
  ApiClient(this._dio, this._cache);

  final Dio _dio;
  final CacheStore _cache;

  Future<Result<T>> get<T>(
    String path, {
    required T Function(dynamic json) parse,
    CachePolicy cache = CachePolicy.memoryDefault,
    String? cacheKey,
    bool forceRefresh = false,
    Map<String, dynamic>? query,
  }) async {
    final key = cacheKey ?? path;

    if (cache.location != CacheLocation.none && !forceRefresh) {
      final hit = _cache.get<T>(key);
      if (hit != null) return Success(hit);
    }

    return _guard(() async {
      final res = await _dio.get<dynamic>(path, queryParameters: query);
      final value = parse(res.data);
      if (cache.location != CacheLocation.none) _cache.set(key, value, cache);
      return value;
    }, cacheKey: cache.location != CacheLocation.none ? key : null);
  }

  Future<Result<T>> post<T>(String path, {Object? body, required T Function(dynamic json) parse}) => _guard(() async {
    final res = await _dio.post<dynamic>(path, data: body);
    return parse(res.data);
  });

  Future<Result<T>> put<T>(String path, {Object? body, required T Function(dynamic json) parse}) => _guard(() async {
    final res = await _dio.put<dynamic>(path, data: body);
    return parse(res.data);
  });

  Future<Result<T>> delete<T>(String path, {required T Function(dynamic json) parse}) => _guard(() async {
    final res = await _dio.delete<dynamic>(path);
    return parse(res.data);
  });

  Future<Result<T>> _guard<T>(Future<T> Function() call, {String? cacheKey}) async {
    try {
      return Success(await call());
    } on DioException catch (e) {
      final error = _mapDioError(e);

      if (error.kind == ErrorKind.offline && cacheKey != null) {
        final stale = _cache.get<T>(cacheKey);
        if (stale != null) return Success(stale);
      }
      return Failure(error);
    } catch (e) {
      return Failure(AppError.unknown(e));
    }
  }

  AppError _mapDioError(DioException e) {
    final kind = switch (e.type) {
      DioExceptionType.connectionTimeout || DioExceptionType.sendTimeout || DioExceptionType.receiveTimeout => ErrorKind.timeout,
      DioExceptionType.connectionError => ErrorKind.offline,
      DioExceptionType.badResponse => switch (e.response?.statusCode ?? 0) {
        401 => ErrorKind.unauthorized,
        404 => ErrorKind.notFound,
        >= 500 => ErrorKind.server,
        _ => ErrorKind.validation,
      },
      _ => ErrorKind.unknown,
    };
    return AppError(kind: kind, message: _messageFor(kind, e), code: e.response?.statusCode?.toString(), cause: e);
  }

  String _messageFor(ErrorKind kind, DioException e) => switch (kind) {
    ErrorKind.timeout => 'The request timed out',
    ErrorKind.offline => 'You are offline',
    ErrorKind.unauthorized => 'Session expired',
    ErrorKind.notFound => 'Not found',
    ErrorKind.server => 'Something went wrong',
    _ => 'Request failed',
  };
}
