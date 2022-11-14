import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '/infrastructure/network/end_points.dart';

import 'interceptor/request_retry/retry_interceptor.dart';

class LafApiClient {
  /// dio instance
  final Dio _dio;

  /// Defines the base URL that will be used for each network request.
  final String? _baseUrl;


  LafApiClient(this._dio, this._baseUrl) {
    _dio
      ..options.baseUrl = _baseUrl ?? ''
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = <String, dynamic>{}
      ..options.responseType = ResponseType.json
      ..interceptors.addAll([
        LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
            logPrint: print), // LogInterceptor
        RetryInterceptor(
          dio: _dio,
          retries: 2, // retry count (optional)
          retryDelays: const [
            // set delays between retries (optional)
            Duration(milliseconds: 10), // wait 1 sec before first retry
            Duration(milliseconds: 20), // wait 2 sec before second retry
            Duration(milliseconds: 30), // wait 3 sec before third retry
          ],
        ),
      ]);
  }
  // Get:-----------------------------------------------------------------------
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        print(response.data);
      }
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      final errorResponse = <String, dynamic>{};
      errorResponse['error'] = e.response?.data['error'];
      errorResponse['statusCode'] = e.response?.statusCode;
      return errorResponse;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Map<String, dynamic>> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      final errorResponse = <String, dynamic>{};
      errorResponse['error'] = e.response?.data['error'];
      errorResponse['statusCode'] = e.response?.statusCode;
      return errorResponse;
    }
  }

  Future<Map<String, dynamic>> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch<dynamic>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      final errorResponse = <String, dynamic>{};
      errorResponse['error'] = e.response?.data['error'];
      errorResponse['statusCode'] = e.response?.statusCode;
      return errorResponse;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Map<String, dynamic>> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      final errorResponse = <String, dynamic>{};
      errorResponse['error'] = e.response?.data['error'];
      errorResponse['statusCode'] = e.response?.statusCode;
      return errorResponse;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Map<String, dynamic>> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      final errorResponse = <String, dynamic>{};
      errorResponse['error'] = e.response?.data['error'];
      errorResponse['statusCode'] = e.response?.statusCode;
      return errorResponse;
    }
  }
}
