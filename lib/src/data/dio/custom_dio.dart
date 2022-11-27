import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pix/src/utils/storage_util.dart';

class AppDio with DioMixin implements Dio {
  AppDio._() {
    const baseUrl = 'https://lock-pix.onrender.com/';
    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
     connectTimeout: 6000,
    receiveTimeout: 3000,
    );

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
