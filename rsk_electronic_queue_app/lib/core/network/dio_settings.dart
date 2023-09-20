import 'package:dio/dio.dart';

class DioSettings {
  DioSettings() {
    setUp();
  }
  final Dio dio = Dio(BaseOptions());

  void setUp() {
    dio.interceptors.clear();

    final logInterceptor = LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    dio.interceptors.addAll([logInterceptor]);
  }
}
