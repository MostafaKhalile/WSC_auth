import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wsc_auth/src/features/signup/data/models/signup_failed.dart';
import 'package:wsc_auth/src/features/signup/signup_params.dart';
import 'package:wsc_auth/utilities/api_client.dart';
import 'package:wsc_auth/utilities/failure.dart';

abstract class SignUpDataSource<T> {
  Future<Either<CustomException,T>> signUp(SignupParams params);
}

class SignUpDataSourceImpl extends SignUpDataSource<Map> {
  final ApiClient apiClient;
  final String signUpPath;

  SignUpDataSourceImpl({required this.apiClient, required this.signUpPath});

  @override
  Future<Either<CustomException,Map>> signUp(SignupParams params) async{
    Response? response;
    try {
      response = await  apiClient.post(
        signUpPath,
        body: params.toJson(),
      );
      var data = response.data;
      return data;
    } catch (e) {
      return Left(SignupFailed(message: e.toString(),code: response?.data?.statusCode??500));
    }
  }
}
