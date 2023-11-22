import 'package:wsc_auth/core/error/exceptions.dart';
import 'package:wsc_auth/src/features/login/data/models/credentials_dto.dart';

import '../../../../../wsc_auth.dart';

abstract class LogInAPIDataSource {
  Future<JWTTokenModel?> login(CredentialsDTO credentialsDTO);
}

class LoginAPIDatasourceImpl implements LogInAPIDataSource {
  final ApiClient apiClient;
  LoginAPIDatasourceImpl(this.apiClient);

  @override
  Future<JWTTokenModel?> login(
    CredentialsDTO credentialsDTO, {
    String path = 'login',
  }) async {
    try {
      final response =
          await apiClient.post(path, body: credentialsDTO.toJson());
      return JWTTokenModel.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
