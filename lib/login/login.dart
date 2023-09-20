import 'package:dio/dio.dart';
import 'package:wsc_auth/utilities/api_client.dart';

class Login {
  static ApiClient apiClient = ApiClient.instance;
  static Future<Response<dynamic>> login({String path = 'login'}) async {
    return await apiClient.post(path);
  }
}
