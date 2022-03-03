import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_user_project/logger.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }
const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

const BASE_URL = 'https://api.github.com/';

class DioClient {
  late Dio? _dio;
  final String baseUrl;

  static Map<String, String> header() =>
      {'Content-Type': 'application/json; charset=UTF-8'};

  DioClient(
    this.baseUrl,
    Dio? dio,
  ) {
    _dio = dio ?? Dio();
    _dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = header();
    initInterceptors();
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.i(
              'REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}'
              '=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}');
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger.i('RESPONSE uri => ${response.realUri}');
          logger
              .i('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.i(
              'Error[${err.response?.statusCode}] \nResponse Text: [${err.response?.data}]');
          // logger.i('Response Text: [${err.response?.data}]');
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    Response<String> response;
    try {
      if (method == Method.POST) {
        response = await _dio!.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException {
      throw const FormatException('Bad response format');
    } catch (e) {
      rethrow;
    }
  }
}
