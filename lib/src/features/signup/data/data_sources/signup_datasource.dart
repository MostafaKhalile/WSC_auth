import 'package:dio/dio.dart';
import 'package:wsc_api_client/wsc_api_client.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';

abstract class SignUpDataSource {
  Future<UserModel> signUp(SignupParamsInterface params);
}

class SignUpDataSourceImpl implements SignUpDataSource {
  final ApiClient apiClient;
  final String signUpPath;

  SignUpDataSourceImpl({required this.apiClient, required this.signUpPath});

  /// This method is used to sign up a new user
  /// takes [SignupParamsInterface] as a parameter
  /// returns [UserModel] if the request is successful
  /// returns [SignupFailed] if the request is failed
  @override
  Future<UserModel> signUp(SignupParamsInterface params) async {
    Response? response;
    try {
      response = await apiClient.post(
        signUpPath,
        body: params.toJson(),
      );
      var data = (response.data);
      UserModel user = UserModel.fromJson(data);
      return (user);
    } catch (e) {
      throw SignupFailed(
          message: e.toString(), code: response?.statusCode ?? 500);
    }
  }
}
