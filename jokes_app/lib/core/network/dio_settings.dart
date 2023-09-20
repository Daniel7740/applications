import 'package:dio/dio.dart';

class DioSettings {
  DioSettings() {
    setup();
  }
  final dio = Dio(
    BaseOptions(
      headers: {'Accept': 'application/json'},
    ),
  );
  void setup() {
    final interceptors = dio.interceptors;

    final logInterceptors = LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
    interceptors.clear();
    interceptors.add(logInterceptors);
  }
}
