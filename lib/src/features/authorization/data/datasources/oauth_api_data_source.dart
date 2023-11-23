import 'package:dio/dio.dart';
import 'package:wsc_auth/core/error/exceptions.dart';
import 'package:wsc_auth/src/features/authorization/data/models/access_token_model.dart';

import '../../../../../wsc_auth.dart';

abstract class OAuthAPIDataSource {
  Future<AccessTokenModel?> authorize(
    OAuthDTO oAuthDTO,
  );
}

class OAuthAPIDataImpl implements OAuthAPIDataSource {
  final ApiClient apiClient;
  OAuthAPIDataImpl(this.apiClient);

  @override
  Future<AccessTokenModel?> authorize(
    OAuthDTO oAuthDTO, {
    String path = 'connect/token',
  }) async {
    try {
      final response = await apiClient.post(path,
          body: oAuthDTO.toJson(),
          isFormData: true,
          contentType: 'application/x-www-form-urlencoded');
      return AccessTokenModel.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
