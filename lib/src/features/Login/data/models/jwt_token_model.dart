import 'package:wsc_auth/src/features/login/domain/entities/jwt_token.dart';

class JWTTokenModel extends JWTToken {
  const JWTTokenModel({required super.token});

  factory JWTTokenModel.fromJson(Map<String, dynamic> json) {
    return JWTTokenModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
