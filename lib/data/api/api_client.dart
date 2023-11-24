import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart' as io_client;
import 'package:flutter_redux_bp/models/models.dart';

dio.Dio dioClient = dio.Dio();

enum Method {
  get,
  post,
  put,
  delete,
  patch,
}

class ApiConfig {
  const ApiConfig({
    required this.scheme,
    required this.host,
    this.port,
    this.scope,
  });

  final String scheme;
  final String host;
  final int? port;
  final String? scope;

  @override
  String toString() {
    if (port == null) {
      return '$scheme://$host${scope ?? ''}';
    }
    return '$scheme://$host:$port${scope ?? ''}';
  }
}

class ApiResponse<T> extends dio.Response {
  ApiResponse.from(dio.Response response, this.responseKey, {this.fullType})
      : super(
            data: response.data,
            extra: response.extra,
            headers: response.headers,
            isRedirect: response.isRedirect,
            statusCode: response.statusCode,
            redirects: response.redirects,
            statusMessage: response.statusMessage,
            requestOptions: response.requestOptions) {
    _data = _getData();
    _error = _getError();
  }

  final String? responseKey;

  final FullType? fullType;

  T? get resData => _data;

  T? _data;

  T? _getData() {
    if (!isSuccess || data == null) {
      return null;
    }
    dynamic decodedBody = data;
    if (responseKey != null) {
      decodedBody = decodedBody[responseKey];
    }
    return serializers.deserialize(
      decodedBody,
      specifiedType: fullType ?? FullType(T),
    ) as T;
  }

  dio.DioException? _error;

  dio.DioException get error => _error!;

  dio.DioException? _getError() {
    if (isSuccess) {
      return null;
    }
    const String errorKey = 'error';

    dio.DioException error =
        dio.DioException(requestOptions: requestOptions, response: data);
    dynamic decodedBody = error.response?.data[errorKey];
    return serializers.deserialize(
      decodedBody,
      specifiedType: const FullType(dio.DioException),
    ) as dio.DioException;
  }

  // end

  bool get isSuccess => statusCode! >= 200 && statusCode! < 300;

  bool get isUnAuthorizedRequest => statusCode == 401;
}

//ApiClient used to make HTTP/HTTPS calls
class ApiClient extends io_client.IOClient {
  ApiClient({required this.config});

  final ApiConfig config;
  Map<String, String>? authHeaders;

  Map<String, String> get defaultHeaders =>
      <String, String>{'Content-Type': 'application/json'};

  Uri buildUrl({String? path, Map<String, dynamic>? queryParams}) {
    final Uri uri = Uri(
      scheme: config.scheme,
      host: config.host,
      port: config.port,
      queryParameters: queryParams,
      path: '${config.scope ?? ''}$path',
    );

    return uri;
  }

  Future<ApiResponse<R>> callJsonApi<R>({
    required Method method,
    required String path,
    String? fieldName,
    String? s3BucketKey,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool formDataRequest = false,
    Encoding? encoding,
    String? requestKey,
    String? responseKey,
    FullType? fullType,
  }) async {
    dioClient.interceptors.add(RetryInterceptor(
      dio: dioClient,
      logPrint: print,
      retries: 1,
      retryDelays: const [
        Duration(seconds: 1),
      ],
    ));
    final Uri url = buildUrl(path: path, queryParams: queryParams);

    dio.Response response;

    Map<String, dynamic>? requestBody = body;

    if (requestKey != null) {
      requestBody = <String, dynamic>{requestKey: requestBody};
    }
    final String? encodedBody =
        requestBody != null ? json.encode(requestBody) : null;

    final Map<String, String> allHeaders = <String, String>{}
      ..addAll(defaultHeaders)
      ..addAll(authHeaders ?? <String, String>{})
      ..addAll(headers ?? <String, String>{});

    if (formDataRequest) {
      dio.MultipartFile? multiFiles;
      if (fieldName != null && s3BucketKey != null) {
        multiFiles = dio.MultipartFile.fromString(s3BucketKey);
        requestBody![fieldName] = multiFiles;
      }
      var formData = dio.FormData.fromMap(requestBody!);
      switch (method) {
        case Method.post:
          response = await dioClient.post(
            url.toString(),
            data: formData,
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
          );
          break;
        case Method.put:
          response = await dioClient.put(
            url.toString(),
            data: formData,
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
          );
          break;
        case Method.patch:
          response = await dioClient.patch(
            url.toString(),
            data: formData,
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
          );
          break;
        default:
          throw 'Method $method does not exist';
      }
    } else {
      switch (method) {
        case Method.get:
          response = await dioClient.get(
            url.toString(),
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
          );
          break;
        case Method.post:
          response = (await dioClient.post(
            url.toString(),
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
            data: encodedBody,
          ));
          break;
        case Method.put:
          response = await dioClient.put(
            url.toString(),
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
            data: encodedBody,
          );
          break;
        case Method.patch:
          response = await dioClient.patch(
            url.toString(),
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
            data: encodedBody,
          );
          break;
        case Method.delete:
          response = await dioClient.delete(
            url.toString(),
            queryParameters: queryParams,
            options: dio.Options(
              headers: allHeaders,
            ),
          );
          break;
        default:
          throw 'Method $method does not exist';
      }
    }
    debugPrint('''
    ____________________________________
   URL: ${response.requestOptions.path}
    Request-method: ${method.toString()}
    HEADERS: ${response.requestOptions.headers}
    REQUEST-BODY : ${requestBody?.toString()}
    RESPONSE : ${response.data}
    STATUS-CODE : ${response.statusCode}
    ____________________________________
    ''');
    return ApiResponse<R>.from(response, responseKey, fullType: fullType);
  }
}
