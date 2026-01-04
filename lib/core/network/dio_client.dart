import 'dart:async';
import 'package:client_app/core/constants/app_environment.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppEnvironment().baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: _onRequest, onError: _onError),
    );
  }

  static DioClient? _instance;

  factory DioClient() {
    _instance ??= DioClient._internal();
    return _instance!;
  }

  late final Dio _dio;
  Dio get client => _dio;
  final AuthLocalDataSource authLocalDataSource =
      serviceLocator<AuthLocalDataSource>();

  String? _accessToken;
  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }
    handler.next(options);
  }

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode == 401) {
      final requestOptions = error.requestOptions;

      // Si ya hay refresh en curso, esperar
      if (_isRefreshing) {
        await _refreshCompleter?.future;
        return handler.resolve(await _retry(requestOptions));
      }

      _isRefreshing = true;
      _refreshCompleter = Completer<void>();

      try {
        await _refreshToken();
        _refreshCompleter?.complete();
        return handler.resolve(await _retry(requestOptions));
      } catch (e) {
        _refreshCompleter?.completeError(e);
        await clearTokens();
        return handler.reject(error);
      } finally {
        _isRefreshing = false;
      }
    }

    handler.next(error);
  }

  Future<void> _refreshToken() async {}

  Future<Response<dynamic>> _retry(RequestOptions request) {
    final options = Options(method: request.method, headers: request.headers);

    return _dio.request(
      request.path,
      data: request.data,
      queryParameters: request.queryParameters,
      options: options,
    );
  }

  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
  }

  Future<void> clearTokens() async {
    _accessToken = null;
  }
}
