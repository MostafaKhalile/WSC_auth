import 'dart:convert';
import 'dart:developer';

import 'package:wsc_auth/src/features/Login/data/models/credentials_dto.dart';

import '../../../../../wsc_auth.dart';
import '../models/jwt_token_model.dart';

abstract class LogInAPIDataSource {
  Future<JWTTokenModel?> login(CredentialsDTO credentialsDTO);
}

class LoginAPIDatasourceImpl implements LogInAPIDataSource {
  ApiClient apiClient = ApiClient.instance;
  LoginAPIDatasourceImpl();

  @override
  Future<JWTTokenModel?> login(
    CredentialsDTO credentialsDTO, {
    String path = 'login',
  }) async {
    try {
      final response = await apiClient.post(path,
          attachToken: false, body: credentialsDTO.toJson());
      log(response.data);
      log(jsonDecode(response.data).runtimeType.toString());
      return JWTTokenModel.fromJson(jsonDecode(response.data));
    } catch (e, st) {
      log('[LogInAPIDataSource] error ==> $e', stackTrace: st);
      rethrow;
    }
  }
}
