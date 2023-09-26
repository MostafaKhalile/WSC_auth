import 'dart:developer';

import 'package:wsc_api_client/wsc_api_client.dart';

class LoginService {
  static ApiClient apiClient = ApiClient.instance;
  static Future<dynamic> login(
      {String path = 'login', Object body = const {}}) async {
    try {
      final response = await apiClient.post(path, body: body);
      return response.data;
    } catch (e, st) {
      log(e.toString(), stackTrace: st);
    }
    return null;
  }
}
