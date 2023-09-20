import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wsc_auth/utilities/api_client.dart';

class Login {
  static ApiClient apiClient = ApiClient.instance;
  static Future<Response<dynamic>?> login(
      {String path = 'login', Object body = const {}}) async {
    try {
      final response = await apiClient.post(path, body: body);
      return response;
    } catch (e, st) {
      log(e.toString(), stackTrace: st);
    }
    return null;
  }
}
