import 'package:dio/dio.dart';
import 'package:docfinder/core/configs/app_configs.dart';
import 'package:docfinder/core/exceptions/http_exception.dart';
import 'package:docfinder/core/services/http/http_service.dart';

/// Http service implementation using the Dio package
///
/// See https://pub.dev/packages/dio
class DioHttpService implements HttpService {
  /// Creates new instance of [DioHttpService]
  DioHttpService({
    Dio? dioOverride,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
  }

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    final response = await dio.get<dynamic>(
      endpoint,
      queryParameters: queryParameters,
    );
    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response<dynamic> response = await dio.post<Map<String, dynamic>>(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future<dynamic> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
