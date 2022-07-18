import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:quote_clean_archituctre/core/network/api/api_consumer.dart';
import 'package:quote_clean_archituctre/core/network/api/end_points.dart';
import 'package:quote_clean_archituctre/core/network/api/status_code.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 15:24.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class DioConsumer extends ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    client.options
      ..baseUrl = baseUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(LogInterceptor(
      request: true,
      error: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    client.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      options.headers['Authorization'] = 'Bearer {Token.token}';
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));
  }

  @override
  Future get(String url, [Map<String, dynamic>? params]) async {
    var response = await client.get(url, queryParameters: params);
    return (jsonDecode(response.toString()));
  }

  @override
  Future post(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? params}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
