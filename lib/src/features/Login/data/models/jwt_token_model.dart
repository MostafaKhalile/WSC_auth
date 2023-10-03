import 'package:wsc_auth/src/features/Login/domain/entities/jwt_token.dart';

class JWTTokenModel extends JWTToken {
  const JWTTokenModel({required super.token});

  factory JWTTokenModel.fromJson(Map<String, dynamic> json) {
    return JWTTokenModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    return _data;
  }
}
