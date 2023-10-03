import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../wsc_auth.dart';
import '../models/jwt_token_model.dart';

abstract class LogInDataSource {
  static ApiClient apiClient = ApiClient.instance;
  static Future<Either<Failure, JWTTokenModel>> login(
      {String path = 'login', Object body = const {}}) async {
    try {
      final response = await apiClient.post(path, body: body);
      return Right(JWTTokenModel.fromJson(response.data));
    } catch (e, st) {
      log(e.toString(), stackTrace: st);
      return Left(ServerFailure());
    }
  }
}
