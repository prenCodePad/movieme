import 'package:dio/dio.dart';
import '../config/config.dart';

class BaseDio {
  final String baseUrl;
  const BaseDio({this.baseUrl = ''});

  Dio create() {
    return Dio(BaseOptions(validateStatus: (status) => true))..interceptors.add(AddTokenInterceptor());
  }
}

class AddTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = StoragePrefs.getStorageValue('token');
    Map<String, dynamic> headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "bearer $token",
    };
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }
}
